# dotfiles-private

Private dotfiles managed by [chezmoi](https://chezmoi.io), layered on top of
the public [pdehlke/dotfiles](https://github.com/pdehlke/dotfiles) repo.

The dotfiles-private repo holds configuration that cannot go into the public
repo: credentials, work-specific tool config, private SSH and Git identity, API
tokens, and anything else that is personal or sensitive. Files that are safe to
store in plaintext go here without encryption. Files that contain secrets are
encrypted with [age](https://age-encryption.org) before being committed, so
dotfiles-private can be hosted on GitHub without exposing anything sensitive.

## How it fits into the public repo

chezmoi does not natively merge two source directories, but it supports
`--source` and `--config` flags to apply from an alternate source. The wrapper
script `dotfiles-apply` (deployed to `~/.local/bin/` by the public repo) applies
the public layer first, then the dotfiles-private layer second. Both passes share the same
destination (`~`), so files from either repo land in the home directory
normally. The rule is: a file is managed by exactly one repo. There are no
overlaps.

## Repo structure

```
.chezmoiroot                         # tells chezmoi the source dir is root/
.chezmoiversion                      # minimum chezmoi version required
root/
  .chezmoiignore                     # OS-specific path excludes
  encrypted_dot_<name>.age           # encrypted managed files
  dot_<name>                         # plain (unencrypted) managed files
  dot_config/...                     # subdirectory structure mirrors $HOME
```

## How the age / 1Password encryption works

Encrypted files are committed to dotfiles-private as `.age` ciphertext. chezmoi
decrypts them on apply using an [age](https://age-encryption.org) keypair.

The keypair is stored in 1Password (vault: **Private**, item: **"dotfiles-private
age key"**) with two fields:

- `public_key` -- the age recipient (`age1...`), used to encrypt files
- `private_key` -- the age identity (`AGE-SECRET-KEY-1...`), used to decrypt

The private key is **never written to a persistent path on disk**. Instead,
both scripts below use the same pattern:

1. Create a `chmod 700` temp directory via `mktemp -d`.
2. Register a `trap` to `rm -rf` the directory on exit, including on error or
   signal.
3. Retrieve the private key from 1Password via `op read` and write it into the
   temp directory with `chmod 600`.
4. Generate a throw-away chezmoi config that points `age.identity` at the temp
   file and `age.recipient` at the public key (also read from 1Password).
5. Run chezmoi with `--config` pointing at the throw-away config.
6. The trap fires, the temp directory and everything in it is deleted.

The private key is on disk for the duration of the chezmoi invocation only.
The public key is not sensitive and is visible in the 1Password item.

The encryption config is entirely separate from the public repo's
`~/.config/chezmoi/chezmoi.yaml`. Machines that only use the public repo have
no knowledge of age, no identity file to manage, and no errors if the key is
absent.

## Prerequisites

On any machine where dotfiles-private will be used:

- `age` installed: `brew install age`
- `op` CLI installed and signed in: `eval $(op signin)`
- Public dotfiles repo applied first (deploys `dotfiles-apply`, `chezmoi-add`, and `pchezmoi` to `~/.local/bin/`)
- dotfiles-private cloned to `~/.yadr-private`

## Creating the age key in 1Password

This only needs to be done once. If the "dotfiles-private age key" item already
exists in your Private vault, skip this section.

**1. Install age**

```sh
brew install age
```

**2. Generate a keypair into a restricted temp directory**

```sh
SCRATCH="$(mktemp -d)" && chmod 700 "${SCRATCH}"
age-keygen -o "${SCRATCH}/age-key.txt"
```

`age-keygen` writes the secret key to the file and prints the public key
(`age1...`) to stderr.

**3. Store both keys in 1Password**

```sh
PUBLIC_KEY="$(grep '^# public key:' "${SCRATCH}/age-key.txt" | awk '{print $NF}')"
PRIVATE_KEY="$(grep '^AGE-SECRET-KEY' "${SCRATCH}/age-key.txt")"

op item create \
  --category "Secure Note" \
  --vault "Private" \
  --title "dotfiles-private age key" \
  "public_key[text]=${PUBLIC_KEY}" \
  "private_key[concealed]=${PRIVATE_KEY}"
```

**4. Delete the temp files**

```sh
rm -rf "${SCRATCH}"
```

**5. Verify**

```sh
op item get "dotfiles-private age key" --vault Private
```

The `public_key` field should be visible. The `private_key` field should show
`[use 'op item get ... --reveal' to reveal]`.

## Applying dotfiles

`dotfiles-apply` is deployed to `~/.local/bin/` by the public repo and handles both layers:

```sh
dotfiles-apply        # apply public layer, then private layer
dotfiles-apply -n -v  # dry run with verbose output
```

The script skips the private layer gracefully if `~/.yadr-private` does not
exist, so the public repo's apply is unaffected on machines where dotfiles-private is not present.

The private layer requires `op` to be signed in. If it is not, `op read` will
fail and the script will exit before chezmoi runs.

## Adding files

### Encrypted files (secrets)

Use `chezmoi-add` instead of bare `chezmoi add --encrypt`. It is deployed by
the public repo to `~/.local/bin/` and sets up the ephemeral key environment
before calling chezmoi (via `pchezmoi`, which points chezmoi at the private
repo):

```sh
chezmoi-add ~/.some-secret-file
```

This reads the age key from 1Password, calls `chezmoi add --encrypt`, and
leaves the temp files to be cleaned up by the trap. The result is an
`encrypted_dot_some-secret-file.age` file in `root/`. Commit and push that
file normally -- it is safe to store in the repo.

Multiple files can be added in one call:

```sh
chezmoi-add ~/.netrc ~/.aws/credentials
```

### Plain files (private but not secret)

Files that are private (work config, personal preferences) but do not contain
secrets can be added without encryption by copying them into the source
directory with the appropriate chezmoi prefix:

```sh
cp ~/.gitconfig-work ~/.yadr-private/root/dot_gitconfig-work
```

Subdirectory structure mirrors `$HOME`. A file that belongs at
`~/.config/foo/bar` would go at `root/dot_config/foo/bar`.

Then commit and push from `~/.yadr-private`.

## Bootstrap on a new machine

```sh
# 1. Apply the public dotfiles layer (installs chezmoi, applies ~/.yadr)
sh -c "$(curl -fsLS https://raw.githubusercontent.com/pdehlke/dotfiles/main/install.sh)"

# 2. Sign in to 1Password CLI
eval $(op signin)

# 3. Clone dotfiles-private
git clone git@github.com:pdehlke/dotfiles-private.git ~/.yadr-private

# 4. Apply both layers -- age key is retrieved from 1Password automatically
dotfiles-apply
```
