# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

YADR is a personal dotfile repo managed with [chezmoi](https://chezmoi.io). The source files live under `root/` and chezmoi applies them to `$HOME`. The repo is public; secrets live in a companion private repo (`~/.yadr-private`) applied via the `dotfiles-apply` wrapper script.

## Applying changes

```sh
# Apply the public layer only
chezmoi apply --verbose

# Apply both public and private layers (requires op CLI signed in)
dotfiles-apply

# Dry run
dotfiles-apply -n -v

# Preview before applying
chezmoi diff --verbose
```

## Chezmoi source conventions

- Files in `root/` mirror `$HOME`. chezmoi prefixes encode behavior:
  - `dot_foo` -> `~/.foo`
  - `private_dot_foo` -> `~/.foo` (mode 600)
  - `executable_foo` -> `foo` (chmod +x)
  - `create_foo` -> create only if absent
  - `symlink_foo` -> symlink
  - `empty_foo` -> empty file
  - `*.tmpl` -> Go template (rendered before applying)
  - `run_onchange_*` -> script run when its content hash changes
  - `.chezmoiexternal.yaml` -> fetch external content (git repos, archives)
  - `.chezmoidata/*.yaml` -> data available in templates as `.`

- Templates reference chezmoi data: `.name`, `.email`, `.param.color`, `.isContainer`, `.chezmoi.os`, `.chezmoi.homeDir`, etc.
- Run `chezmoi data --format yaml` (alias: `czD`) to see all available template variables.

## Editing dotfiles

The preferred workflow is to edit the source directly with chezmoi:

```sh
cze ~/.zshrc         # edit source state and apply on save
czA ~/.some-new-file # add a file to source state
czd                  # diff destination vs target state
```

Alternatively, edit files under `root/` directly and run `chezmoi apply`.

## ZSH customization

- `root/aliases.sh` -- shell aliases loaded at startup; edit with `ae`, reload with `ar`
- `root/dot_zsh.after/` -- ZSH snippets sourced after zsh4humans initializes (filename prefix controls load order)
- `root/dot_zshrc.tmpl` -- main zshrc (template); sets `$yadr` to the chezmoi source dir

When writing or updating shell scrpts in this repo, pay attention to and use the functions defined in .zsh.after/000_functions.zsh. In particular, make use of the log() function instead of using `echo` or an `echo ... ; exit 1` for error handling. The only exception to this rule is shell scripts like `install.sh` or the `.chezmoiscripts/*` scripts that are expected to execute before chezmoi has installed .zsh.after.

Prefer `zsh` for writing shell scripts. Always load the `write-zsh-scripts` skill before starting, whether you are writing a new zsh script from scratch or editing an existing one. In addition to the instructions in that skill, ensure that every `zsh` script you work on adds PROMPT_SUBST to the initial setopt line and also contains `PS4='+(%x:%I): ${funcstack[1]:+${funcstack[1]}(): }'`. Always add these to new scripts. If they do not exist in scripts you're modifying, ask the user before adding them.

## Neovim configuration

Source: `root/private_dot_config/nvim/`

- Based on [LazyVim](https://lazyvim.org). Extend LazyVim defaults, don't replace.
- Language: Lua. Format with `stylua .` (4-space indent, 120-char line width).
- Check health: `nvim +checkhealth +qa`
- `lua/config/` -- options, keymaps, autocmds, lazy bootstrap
- `lua/plugins/*.lua` -- plugin specs (return a table, lazy.nvim format)
- `lua/util/` -- shared utilities
- See `root/private_dot_config/nvim/AGENTS.md` for more detail.

## Tool versions (mise)

Managed via `root/private_dot_config/mise/config.toml.tmpl`. Heavy tools (node, java, opentofu, aws-cli) are skipped inside containers. Lock file at `root/private_dot_config/mise/mise.lock`.

## Private dotfiles layer

- Private repo cloned to `~/.yadr-private`
- Encryption: age keypair stored in 1Password (vault: Private, item: "dotfiles-private age key")
- The age private key is never written to a persistent path -- retrieved ephemerally via `op read` at apply time
- To add an encrypted file: `chezmoi-add ~/.secret-file` (deployed by the private repo)
- `~/.claude` and `~/.agents` are managed entirely by `.yadr-private` (not this repo) -- there is no `dot_claude/` or `dot_agents/` here. Plain `chezmoi apply` (public layer only) does not touch them; only `dotfiles-apply` does.
- See `docs/dotfiles-private.md` for full setup instructions

## Security

- Never commit secrets, credentials, or API tokens to this repo -- they belong in dotfiles-private
- The `gitleaks`-based pre-commit hook scans for secrets before every commit
- Encrypted files in the private repo have the `.age` extension
