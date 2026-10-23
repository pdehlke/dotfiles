#!/usr/bin/env python3
"""List names under a domain that appear in Certificate Transparency logs and
complete a TLS handshake on port 443 using SNI.

Usage: ct443.py example.com [--concurrency N] [--timeout S] [--no-verify]

Names come from crt.sh, falling back to the Cert Spotter API if crt.sh fails
(it often times out on large domains). Each name gets a TLS handshake with SNI
set to that name. By default the certificate must validate and match the name,
so a CDN or load balancer that accepts the connection but serves a default
certificate for some other name does not count as reachable. --no-verify
accepts any completed handshake instead.

Reachable names go to stdout, one per line; progress and errors go to stderr.
Standard library only.
"""

import argparse
import asyncio
import json
import ssl
import sys
import time
import urllib.parse
import urllib.request
from concurrent.futures import ThreadPoolExecutor

USER_AGENT = "ct443/1.0"


def log(msg):
    print(msg, file=sys.stderr, flush=True)


def http_json(url, timeout):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return json.load(resp)


def from_crtsh(domain):
    url = "https://crt.sh/?" + urllib.parse.urlencode(
        {"q": f"%.{domain}", "output": "json"}
    )
    names = set()
    for row in http_json(url, timeout=120):
        # Either field can be present but null.
        names.update((row.get("name_value") or "").split("\n"))
        names.add(row.get("common_name") or "")
    return names


def from_certspotter(domain):
    # Unauthenticated access is rate limited, so this is a fallback only.
    names = set()
    after = None
    while True:
        params = {
            "domain": domain,
            "include_subdomains": "true",
            "expand": "dns_names",
        }
        if after:
            params["after"] = after
        url = "https://api.certspotter.com/v1/issuances?" + urllib.parse.urlencode(params)
        page = http_json(url, timeout=60)
        if not page:
            return names
        for issuance in page:
            names.update(issuance.get("dns_names", []))
        after = page[-1]["id"]


def ct_names(domain):
    sources = [("crt.sh", from_crtsh)] * 3 + [("certspotter", from_certspotter)]
    for name, fetch in sources:
        try:
            log(f"querying {name} ...")
            raw = fetch(domain)
            break
        except Exception as e:
            log(f"{name} failed: {e}")
            time.sleep(2)
    else:
        sys.exit("all CT sources failed")

    out = set()
    for n in raw:
        n = n.strip().lower().rstrip(".")
        # A wildcard entry can't be probed directly; probe its parent instead.
        if n.startswith("*."):
            n = n[2:]
        if n == domain or n.endswith("." + domain):
            out.add(n)
    return out


async def probe(name, ctx, timeout, sem):
    async with sem:
        try:
            _, writer = await asyncio.wait_for(
                asyncio.open_connection(name, 443, ssl=ctx, server_hostname=name),
                timeout,
            )
        except Exception:
            return None
        writer.close()
        try:
            await asyncio.wait_for(writer.wait_closed(), 1)
        except Exception:
            pass
        return name


async def scan(names, concurrency, timeout, verify):
    loop = asyncio.get_running_loop()
    # open_connection resolves names through the default executor, which is
    # small by default and would serialize DNS lookups.
    loop.set_default_executor(ThreadPoolExecutor(max_workers=concurrency))

    ctx = ssl.create_default_context()
    if not verify:
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE

    sem = asyncio.Semaphore(concurrency)
    tasks = [asyncio.create_task(probe(n, ctx, timeout, sem)) for n in names]
    reachable = []
    for i, fut in enumerate(asyncio.as_completed(tasks), 1):
        result = await fut
        if result:
            reachable.append(result)
        if i % 100 == 0 or i == len(tasks):
            log(f"probed {i}/{len(tasks)}, {len(reachable)} reachable")
    return reachable


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("domain")
    ap.add_argument("--concurrency", type=int, default=200)
    ap.add_argument("--timeout", type=float, default=5.0, help="per-host seconds")
    ap.add_argument(
        "--no-verify",
        action="store_true",
        help="count any completed TLS handshake, even with an invalid or mismatched cert",
    )
    args = ap.parse_args()

    domain = args.domain.strip().lower().rstrip(".")
    names = ct_names(domain)
    log(f"{len(names)} unique names from CT")

    start = time.monotonic()
    reachable = asyncio.run(scan(sorted(names), args.concurrency, args.timeout, not args.no_verify))
    log(f"scan took {time.monotonic() - start:.1f}s")

    for n in sorted(reachable):
        print(n)


if __name__ == "__main__":
    main()
