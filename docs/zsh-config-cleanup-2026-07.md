# Zsh config cleanup — July 2026

Result of a full audit of the zsh configuration for duplications,
contradictions, and dead config. Every change on the `worktree-zsh-audit-fixes`
branch is listed here, grouped by file.

## Decisions that shaped the changes

- **peco over fzf everywhere they competed.** peco now owns `^R` history search
  and the file/dir/cdr finders. fzf remains only where peco cannot substitute:
  z4h's internal completion UI (not replaceable) and `flap` (needs live
  preview).
- **Hybrid `cd`.** Both zoxide (`--cmd cd`) and a custom `cd()` wanted to own
  `cd`; zoxide was silently winning. The new `cd` keeps zoxide frecency jumping
  and restores the cd-to-parent-when-given-a-file behavior.
- **`mkcd` is the canonical mkdir+cd.** The duplicate `md()` in .zshrc is gone.
- **`co` means `git checkout`** again. A later Rails 2 `co='script/console'` had
  been silently shadowing it.
- **Android support kept.** The android/oh-my-zsh template branch stays, but
  darwin no longer clones/updates oh-my-zsh for nothing.
- **Synonym alias piles kept** (`gst`/`gstsh`, `gsh`/`gshw`/`gshow`,
  `gcm`/`gcim`, `gl`/`glg`/`glog`, `gf`/`gfch`, `gdc`/`gds`) — muscle memory.

## Files deleted

| File                                      | Why                                                                                                                                   |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `root/dot_zsh.after/zzz_fzf.zsh`          | Sourced fzf keybindings that clobbered peco's `^R` binding (loaded last, always won). Also PATH'd a third fzf copy in `~/.fzf`.       |
| `root/dot_zsh.after/zzzz_finish.zsh`      | Its only line (`typeset -U PATH`) duplicates the same line at the end of `.zshrc`, which runs after all `.zsh.after` snippets anyway. |
| `root/private_dot_config/fzf/fzf.sh.tmpl` | fzf helper opts (CTRL_R/CTRL_T/ALT_C) for keybindings we no longer load.                                                              |
| `root/dot_zsh.prompts/`                   | Empty legacy dir (`.keep` only), referenced nowhere.                                                                                  |
| `root/dot_zsh.before/`                    | Empty dir; `.zshrc` never sourced it. CLAUDE.md updated to match.                                                                     |

`.chezmoiremove` gained entries for `.zsh.after/zzz_fzf.zsh`,
`.zsh.after/zzzz_finish.zsh`, `.config/fzf`, `.zsh.prompts`, and `.zsh.before`,
so the next `chezmoi apply` removes the stale copies from `$HOME`.

## root/dot_zshrc.tmpl

- Removed commented-out `theme.zsh` source (line 13); the real `z4h source` of
  the same file further down still runs.
- Inverted the android template conditional: the non-android side only produced
  a dead commented prezto line, now it produces nothing.
- `z4h install ohmyzsh/ohmyzsh` is now android-only. On darwin the clone's sole
  consumer was a commented-out ssh-agent plugin (1Password agent is used
  instead), yet z4h kept the clone updated on every `z4h update`.
- Removed `example-hostname` ssh zstyles (z4h skeleton leftovers); kept the
  `':z4h:ssh:*' enable 'no'` default.
- Removed `send-extra-files '~/.nanorc' '~/.env.zsh'` — ssh teleport is disabled
  and neither file exists.
- Added `fpath+=($HOMEBREW_PREFIX/share/zsh-completions(-/N))` **before**
  `z4h init`, which is where fpath additions must live for z4h's own compinit to
  see them. This replaces the FPATH+manual-compinit dance that
  `02_completions.zsh` did too late.
- Removed `md()` and its compdef (duplicate of `mkcd`).

## root/aliases.sh

Fixed:

- `alias -g N='| /dev/null'` → `'> /dev/null'`. The old version piped into
  /dev/null as if it were a command ("permission denied").
- `cb` converted from fzf to peco.
- `co='git checkout'` restored (shadowing Rails alias deleted).
- `du`: was aliased (line 38), unconditionally unaliased (line 235), then
  re-aliased to `gdu -h -t 2` (line 245) — and `-t` is GNU du's _threshold_, not
  depth, so that was a flag typo on top. Now a single `du='du -h -d 2'`;
  coreutils gnubin is first in PATH so this is GNU du regardless.
- Deleted the second, broken `quiet_which()` (`command -v "\$1"` checked the
  literal string `$1`, always false). The correct copy lives in
  `000_functions.zsh`. Previously `ar` (alias reload) would re-install the
  broken copy over the good one.
- Header comment no longer claims bash compatibility (the file uses `alias -g`,
  `TRAPHUP`, `$+commands` — zsh-only).

Deleted dead config (commands not installed, or broken):

- Ruby/Rails era, none installed: `c`, `co` (script/console), `cod`, `ts`
  (thin), `ms` (mongrel), `tfdl`, `tftl`, `rdm`, `rdmr`, `rs`, the whole zeus
  block (`zs` `zc` `zr` `zrc` `zrs` `zrdbm` `zrdbtp` `zzz`), the whole spring
  block (`sr` `src` `srgm` `srdm` `srdt` `srdmt` `dbtp` `dbm` `dbmr` `dbmd`
  `dbmu`), `sgi` (`--no-ri`/`--no-rdoc` died with RubyGems 3), `psr`.
- `sp`/`spb` — Sprintly shut down years ago.
- `portforward` — ipfw was removed from macOS in 10.10.
- `ave`/`avc`/`avl` — aws-vault not installed.
- `t` — todo.sh not installed (taskwarrior aliases kept; `task` is installed).
- `gtr`/`gpub` — called `git recent-branches track|publish`, but
  `recent-branches` is a plain for-each-ref one-liner with no subcommands;
  relics of an old YADR script. `grb` itself kept.
- Commented-out fasd/`v`/`vd`/`zd` block and commented `cat` theme variant.
- The `unalias grc` guard block — nothing ever aliases grc.

Kept deliberately: asdf aliases (asdf is installed alongside mise), all alias
synonym piles, `pfm=npm`, ls/ll flag redundancies (`-A` appears twice in the
final darwin `ls` expansion — harmless, not worth churning muscle-memory aliases
over).

## root/dot_zsh.after/000_env.zsh

- Deleted `AWS_SESSION_TOKEN_TTL` (aws-vault var; aws-vault gone).
- Deleted `ARCHFLAGS` (2014-era Xcode/Ruby build workaround).
- Deleted `TODOTXT_DEFAULT_ACTION` (todo.sh gone).
- Deleted commented `JAVA_HOME` export and the pointer to
  `01_version_managers.zsh`, a file that no longer exists; comment now points at
  mise, which actually manages java.
- Deleted commented `HOMEBREW_AUTO_UPDATE_SECS` line.

## root/dot_zsh.after/000_functions.zsh

- Deleted `findinpath`, `dirpre`, `dirapplist`, `dirprelist` — zero callers
  anywhere in the repo (and `dirprelist`'s usage message was a copy-paste of
  `dirapplist`'s). The `dirapp` chain (`test_directory`,
  `canonicalize_directory`, `in_search_path`, `dirapp`) stays; it has callers.

## root/dot_zsh.after/000_path.zsh

- Deleted the hardcoded `PATH=/opt/homebrew/bin:/usr/local/bin:$PATH` prepend.
  z4h already ran the cached path_helper output and homebrew init before .zshrc
  even starts (verified: `-z4h-init-homebrew` in z4h's main.zsh), and
  `brew shellenv` on the next line covers the rest.
- Deleted `HOMEBREW_AUTO_UPDATE_SECS=3600` — it directly contradicted
  `HOMEBREW_NO_AUTO_UPDATE=1` in `000_env.zsh`, which wins (manual updates via
  `brewu` are the established habit).
- Deleted `dirapp PATH ~/bin` — `.zshrc` already adds `~/bin`, and the directory
  doesn't exist anyway.

## root/dot_zsh.after/02_completions.zsh

- Removed the FPATH-then-compinit block: compinit had already run inside
  `z4h init`, so this was a second (and `09_bash-my-aws.zsh` a third) full
  compinit per shell start. The zsh-completions fpath entry moved to .zshrc
  before `z4h init` (see above). The nonstandard
  `$(brew --prefix)/completions/zsh` path only contained `_brew`, which brew
  also installs to site-functions — already in z4h's fpath.
- Removed the zsh-autosuggestions source: z4h bundles and loads
  zsh-autosuggestions itself, so the brew copy was loaded on top of it.
  `ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE` in `000_env.zsh` still applies to the z4h
  copy.
- git-flow completions kept — git-flow is installed.

## root/dot_zsh.after/09_bash-my-aws.zsh

- Dropped `autoload -U +X compinit && compinit` (third compinit per startup).
  `bashcompinit` kept; it builds on the compinit z4h already ran.

## root/dot_zsh.after/functions.zsh

- Custom `cd()` removed; replaced by the hybrid in `zoxide.zsh` (below). A
  breadcrumb comment points there.
- Fixed `peco-directories`: it captured the selection into `$dir` but inserted
  `${file}` into the command line — the widget had never actually worked.
- `peco-cdr` is now registered (`zle -N`) and bound to `^Xr`, which its own
  comment always promised but never did. The `cdr`/`chpwd_recent_dirs` plumbing
  above it finally has a consumer.
- Merged the two back-to-back `if hash git` guards around `unalias diff` and the
  `diff()` definition into one, switching to the `function diff()` keyword form.
  The two-block layout turned out to be load-bearing: z4h aliases `diff`, and
  zsh refuses to parse a POSIX-style `diff() {...}` while the alias is live (the
  unalias in a merged block executes only after the whole block parses). The
  `function` keyword is immune to alias expansion, so the merged block is now
  safe; the runtime `unalias` still removes the alias so the function actually
  gets called.
- `flap` intentionally still uses fzf (peco has no preview pane); it uses brew's
  fzf.

## root/dot_zsh.after/zoxide.zsh

- zoxide was initialized **twice** (once with `--cmd cd`, once plain). Now a
  single plain `zoxide init zsh` (provides `z`/`zi`), followed by the hybrid
  `cd()`:
  - `cd old new` → zsh's two-argument substitution cd (replaces `old` with `new`
    in `$PWD`), preserving the old custom cd's second feature;
  - `cd /path/to/file` → cd to the file's parent (the `vi foo; cd !$` trick);
  - everything else → `__zoxide_z` (real dirs behave like plain cd, keywords
    jump by frecency).
- If zoxide is missing (some containers), plain builtin `cd` applies.

## root/dot_zsh.after/10_peco_shell_history.zsh

- Unchanged — but its `^R` binding now survives, because the fzf keybinding file
  that used to load after it and steal `^R` is gone.

## CLAUDE.md

- Removed the `root/dot_zsh.before/` bullet (directory deleted; .zshrc never
  sourced it).

## Flagged but intentionally not touched

- `root/dot_gitconfig.tmpl` defines the `amend` alias twice (`commit --amend` at
  line 50, `commit -a --amend` at line 136 — the latter wins, so `gam` currently
  auto-stages everything). Out of scope for a zsh cleanup; worth a separate
  decision.
- `10_peco_shell_history.zsh` uses `which` instead of `command -v` — works, left
  alone to keep the diff minimal.
- Per-CLAUDE.md `PS4`/`PROMPT_SUBST` script conventions were not added to the
  `.zsh.after` snippets: they are sourced into interactive shells, not
  standalone scripts, and a global `PS4` export would leak into every shell.
- `z4h source ~/.env.zsh` kept even though the file doesn't exist here — it's
  the standard z4h hook for per-machine local config.
- `dot_oh-my-zsh/custom/.chezmoiexternal.yaml` (p10k + zsh-completions clones)
  kept as-is for the android setup, per decision above.

## Verification performed

- `zsh -n` clean on aliases.sh and all 12 remaining `.zsh.after` files.
- `dot_zshrc.tmpl` rendered through `chezmoi execute-template` with live data
  and syntax-checked; confirmed the darwin render has no ohmyzsh install, no
  `md()`, and includes the new fpath line.
- Live interactive-shell test: `co`, `du`, `N`, `cb`, `ts` resolve to the
  intended values; `cd /etc/hosts` lands in `/etc`; plain dir cd works;
  `quiet_which` works; `^R` → `peco_select_history`, `^Xf`/`^X^F`/`^Xr` all
  bound to their peco widgets.
