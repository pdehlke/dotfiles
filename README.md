```
 _     _           _
| |   | |         | |
| |___| |_____  __| | ____
|_____  (____ |/ _  |/ ___)
 _____| / ___ ( (_| | |
(_______\_____|\____|_|

# Yet Another Dotfile Repo v3.0
# Now with chezmoi, zsh4humans, direnv, mise-en-place, and a complete neovim IDE!

```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![PRs Welcome][prs-badge]&nbsp;![macos supported][apple-logo]&nbsp;![linux supported][linux-logo]

---

<!--toc:start-->

<details>
<summary>Table of Contents</summary>

- [About YADR](#about-yadr)
- [Screenshot](#screenshot)
- [Installation](#installation)
  - [What the installer actually does](#what-the-installer-actually-does)
  - [Convenience script](#convenience-script)
  - [Manually with `git`](#manually-with-git)
  - [Manually with `chezmoi`](#manually-with-chezmoi)
  - [I already have a chezmoi repo](#i-already-have-a-chezmoi-repo)
- [Private dotfiles](#private-dotfiles)
  - [dotfiles-apply](#dotfiles-apply)
  - [Setting up the private repo](#setting-up-the-private-repo)
- [Finish the install with fonts and colors](#finish-the-install-with-fonts-and-colors)
  - [Install Solarized colors in your terminal of choice](#install-solarized-colors-in-your-terminal-of-choice)
  - [Remap caps-lock to escape with Karabiner-Elements](#remap-caps-lock-to-escape-with-karabiner-elements)
  - [Set up a system wide hotkey for iTerm](#set-up-a-system-wide-hotkey-for-iterm-keyshotkey)
  - [Turn off native full-screen windows](#turn-off-native-full-screen-windows)
- [If you want to run classic vim in the terminal](#if-you-want-to-run-classic-vim-in-the-terminal)
- [Upgrading](#upgrading)
- [What's included and how to customize](#whats-included-and-how-to-customize)
  - [Homebrew](#homebrew)
  - [ZSH](#zsh)
    - [Aliases](#aliases)
    - [Dotfiles management aliases](#dotfiles-management-aliases)
  - [Git customizations](#git-customizations)
    - [Secret scanning with gitleaks](#secret-scanning-with-gitleaks)
  - [Myrepos framework configuration](#myrepos-framework-configuration)
  - [SSH agent and identities](#ssh-agent-and-identities)
  - [Developer experience enhancements](#developer-experience-enhancements)
    - [Tool management via mise-en-place](#tool-management-via-mise-en-place)
    - [carapace completions](#carapace-completions)
    - [bash-my-aws](#bash-my-aws)
    - [Automatic python venvs with uv, direnv, and mise](#automatic-python-venvs-with-uv-direnv-and-mise)
    - [RubyGems](#rubygems)
    - [Tmux configuration](#tmux-configuration)
    - [Vimization of everything](#vimization-of-everything)
    - [Image diffs: spaceman-diff](#image-diffs-spaceman-diff)
  - [Editor configurations](#editor-configurations)
    - [A complete neovim IDE based on LazyVim](#a-complete-neovim-ide-based-on-lazyvim)
    - [Classic vim](#classic-vim)
    - [Extending and overriding vim settings](#extending-and-overriding-vim-settings)
- [Testing with Docker](#testing-with-docker)
- [Misc](#misc)
  - [macOS Hacks](#macos-hacks)
  - [Pry](#pry)
- [License](#license)

</details>

<!--toc:end-->

# About YADR

This is a **MacOS** focused fork of
@[nandalopes/dotfiles](https://github.com/nandalopes/dotfiles), which is itself
a **GNU/Linux** focused fork of
@[skwp/dotfiles](https://github.com/skwp/dotfiles).

**Managed with [chezmoi](https://chezmoi.io/).**

This repo has been built for my own benefit, however feel free to sneak in and
steal anything that would improve your own productivity. **YADR is an
opinionated dotfile repo that will make your heart sing**

- The best bits of all the top dotfile repos, editor and zsh plugins curated in
  one place, into a simple and cohesive way of working.
- A complete neovim IDE built on [LazyVim](https://www.lazyvim.org/), with
  dozens of hand-picked plugin specs, plus a classic vim setup with more than 80
  plugins for when you want it.
- A heavily customized, developer focused ZSH environment based on
  [zsh4humans](https://github.com/romkatv/zsh4humans) with lots of extras
- All things are vimized: irb, postgres command line, etc.

_The main difference between this repo and
@[nandalopes/dotfiles](https://github.com/nandalopes/dotfiles) upstream is that
MacOS is fully supported in this fork, just as it was in skwp's original work.
If it doesn't work, please open an issue or submit a PR!_

_The main difference between this repo and
@[skwp/dotfiles](https://github.com/skwp/dotfiles) upstream is that I've moved
off of [prezto](https://github.com/sorin-ionescu/prezto) in favor of
[zsh4humans](https://github.com/romkatv/zsh4humans#customizing-prompt)._

Please use GitHub Issues for pull requests or bug reports only.

---

## Screenshot

![screenshot vim](https://i.imgur.com/5VWlFrJ.png)

## Installation

To get started please run:

```bash
sh -c "`curl -fsSL https://github.com/pdehlke/dotfiles/raw/main/root/bin/yadr/install.sh`"
```

**_If you are not logged in to github or do not have a github token, the
installation will almost certainly fail due to github's unauthenticated request
limit of 60/hour._**

### What the installer actually does

1. Clones this repo to `~/.yadr` (if it isn't there already) and hands off to
   `install.sh`.
2. Installs chezmoi if needed, using whatever is available: mise, asdf,
   Homebrew, apt, dnf, apk, or pacman.
3. Runs `chezmoi init --apply`, which renders the templates, fetches external
   content (tmux plugins, bash-my-aws, and friends), and writes everything into
   `$HOME`.
4. Post-install scripts install fzf, mise-managed tools, and plugins for Sublime
   Text and classic vim.

Neovim installs its own plugins the first time you launch `nvim`; expect a
minute or two of lazy.nvim and mason activity on first start.

### Convenience script

In case of not having `chezmoi` installed - just fire the
[`root/bin/yadr/install.sh`](./root/bin/yadr/install.sh) after a simple download
of it.

### Manually with `git`

You will have to clone the repo and from its root directory, execute the
`install.sh` SH script.

### Manually with `chezmoi`

Leveraging chezmoi capabilities:

```bash
chezmoi init --apply --verbose --source ~/.yadr --no-pager pdehlke/dotfiles
```

### I already have a chezmoi repo

If you want to integrate this repo with yours, do this:

```bash
chezmoi cd
git remote add yadr https://github.com/pdehlke/dotfiles.git
git fetch yadr

# Merge repos:
git merge --allow-unrelated-histories yadr/main

# Verify if there is duplicated source files
chezmoi verify

# Then apply updates
chezmoi apply --verbose
```

## Private dotfiles

This repo is public. Anything that cannot be committed in public -- credentials,
work-specific config, private SSH and Git identity, API tokens -- lives in a
companion private repo,
[pdehlke/dotfiles-private](https://github.com/pdehlke/dotfiles-private), checked
out at `~/.yadr-private`. The two repos are independent chezmoi sources that
share the same destination (`~`). **The rule is that any given file is managed
by exactly one of them.** The private repo also owns entire config trees that
don't belong in public, such as `~/.claude` and `~/.agents`.

### dotfiles-apply

Normally you apply YADR with `chezmoi apply`. When the private repo is also
present, use `dotfiles-apply` instead -- it applies the public layer first, then
the private layer:

```sh
dotfiles-apply        # apply both layers
dotfiles-apply -n -v  # dry run with verbose output
```

The script skips the private layer gracefully if `~/.yadr-private` does not
exist, so it is safe to use as your default apply command on any machine.

The private layer uses [age](https://age-encryption.org) encryption for
sensitive files. The age key is stored in 1Password and retrieved at apply-time;
**it is never written to a persistent path on disk**. Applying the private layer
therefore requires the `op` CLI to be signed in:

```sh
eval $(op signin)
dotfiles-apply
```

To add a new encrypted file to the private layer, use the `chezmoi-add` helper
that the private repo deploys.

### Setting up the private repo

See [docs/dotfiles-private.md](docs/dotfiles-private.md) for full setup
instructions, including how to create the age key in 1Password, bootstrap the
repo on a new machine, and add encrypted files.

## Finish the install with fonts and colors

### Install Solarized colors in your terminal of choice

Change your terminal colors to Solarized. Most terminals on Linux have a
solarized colorscheme installed by default.

### Remap caps-lock to escape with [Karabiner-Elements](https://pqrs.org/osx/karabiner/index.html)

The escape key is the single most used key in vim. Old keyboards used to have
Escape where Tab is today. Apple keyboards are the worst with their tiny Esc
keys. But all this is fixed by remapping Caps to Escape. If you're hitting a
small target in the corner, you are slowing yourself down considerably, and
probably damaging your hands with repetitive strain injuries.

### Set up a system wide hotkey for iTerm (Keys=>Hotkey)

Recommended Cmd-Escape, which is really Cmd-Capslock.

### Turn off native full-screen windows

- In iTerm, uncheck "Native full screen windows" under General. This will give
  you fast full screen windows that are switchable without switching to spaces.
- In MacVim, uncheck "Prefer native full-screen support" under Advanced
  settings. Same reason: the native spaces navigation slows everything down for
  no reason.

## If you want to run classic vim in the terminal

- Make sure you install the Solarized colorscheme in your terminal!
- If you don't want to use a solarized terminal, then make sure you do this:

```vim
let g:yadr_using_unsolarized_terminal = 1
" in ~/.vimrc.before
```

- If you want to use an alternate colorscheme like Gruvbox, then do this:

```vim
let g:yadr_disable_solarized_enhancements = 1
colorscheme base16-twilight
" in ~/.vimrc.after
```

## Upgrading

Upgrading is easy.

```sh
chezmoi update --verbose --dry-run # check updates before apply
chezmoi apply --verbose
```

If you use the private layer, run `dotfiles-apply` afterwards to apply both
layers together.

## What's included and how to customize

Read on to learn what YADR provides!

### Homebrew

I've included my Brewfile in this repo for convenience. It's the full output of
`brew bundle dump`, so it lists _everything_ I have installed. You probably want
to use it as a reference or a starting point for things you will want to have.
Off the top of my head, YADR itself depends on a few things being installed and
first in your $PATH:

- fzf
- a modern git
- a modern zsh
- bat
- coreutils
- chezmoi
- direnv
- mise
- vim
- neovim
- peco
- tmux
- zoxide
- zsh-completions
- 1password

I prefer `ghostty` as my terminal; you might want `kitty` or `iTerm`. Configs
for both ghostty and kitty are managed here under `~/.config`. Regardless, you
want to install appropriate fonts. I prefer `MesloLGS NF`, myself, but YMMV as
long as you use a font that powerlevel10k can work with.

### ZSH

Think of Zsh as a more awesome Bash without having to learn anything new. Syntax
highlighting, autosuggestions, fuzzy completions, and more. We've also provided
lots of enhancements:

- [zsh4humans - the power behind YADR's zsh](https://github.com/romkatv/zsh4humans).
  All previous versions of YADR that I am aware of are based on
  [Prezto](https://github.com/sorin-ionescu/prezto). Prezto is a fantastic
  framework, and Sorin is due all the praise in the world for his contributions
  to the `zsh` community. But over the years, `zsh` startup time had crept up to
  ~2.5 seconds on an M3 Macbook Pro with 64 GB of RAM. `zprof` showed that most
  of that time was spent loading prezto modules and zsh completions. It was time
  for a change, and romkatv's `zsh4humans` easily achieved feature parity with
  the old prezto setup, with a startup time of under 300 ms on the same Macbook
  Pro.
- Vim mode and bash style `Ctrl-R` for reverse history finder
- Fuzzy matching - if you mistype a directory name, tab completion will fix it
- [zoxide](https://github.com/ajeetdsouza/zoxide) integration - hit `z` and a
  partial match to jump to a recently used directory. `cd` itself is
  zoxide-powered too, so it learns as you move around.
- [How to add your own ZSH theme](docs/zsh/themes.md), and
  [powerlevel10k notes](docs/zsh/powerlevel10k.md)

#### Aliases

Lots of things we do every day are done with two or three character mnemonic
aliases. Please feel free to edit them:

```
ae # alias edit
ar # alias reload
```

Do note that you'll be editing `${HOME}/.yadr/root/aliases.sh` directly. Don't
forget that this file is part of the YADR git repo; your changes will not be
present on new installs unless you've forked and pushed.

If you have particularly clever aliases that you think should be in this repo,
please submit a PR.

#### Dotfiles management aliases

| Alias                             | Mnemonic              | What it does                                                                 |
| --------------------------------- | --------------------- | ---------------------------------------------------------------------------- |
| `czI`                             | chezmoi (I)nit        | re-generate the config file                                                  |
| `czh`                             | chezmoi (h)ome        | cd into dotfiles dir                                                         |
| `cza [ file(s) \| folder(s) ]`    | chezmoi (a)pply       | apply _source state_ to _destination_; add `--dry-run` to preview            |
| `czA [ file(s) \| -r folder(s) ]` | chezmoi (A)dd         | add files to _source state_                                                  |
| `czc file(s)`                     | chezmoi (c)at         | show _target state_, according to _source state_                             |
| `cze file(s)`                     | chezmoi (e)dit        | edit a file in _source state_ then apply changes; add `--dry-run` to preview |
| `czE`                             | chezmoi (E)dit-config | edit `chezmoi.yaml` configuration file                                       |
| `czf [ file(s) \| -r folder(s) ]` | chezmoi (f)orget      | remove a file from _source state_                                            |
| `czg`                             | chezmoi (g)it         | run a git command on dotfiles dir                                            |
| `czu`                             | chezmoi (u)pdate      | fetch and apply changes; add `--dry-run` to preview                          |
| `czd [ file(s) \| -r folder(s) ]` | chezmoi (d)iff        | compare _destination_ and _target state_                                     |
| `czD`                             | chezmoi (D)ata        | list chezmoi variables, useful for templating                                |
| `czm file(s)`                     | chezmoi (m)erge       | three-way merge between _destination_, _source state_ and _target state_     |

### Git customizations

YADR will take over your `~/.gitconfig`, so if you want to store your usernames,
please put them into `~/.gitconfig.user`

It is recommended to use this file to set your user info; the first time you
install it, YADR will ask you for the name and email address you want to use on
commits. Alternately, you can set the appropriate environment variables in your
`~/.secrets`.

- `git l` or `gl` - a much more usable git log
- `git b` or `gb` - a list of branches with summary of last commit
- `git r` - a list of remotes with info
- `git t` or `gt` - a list of tags with info
- `git nb` or `gnb` - a (n)ew (b)ranch - like checkout -b
- `git cp` or `gcp` - cherry-pick -x (showing what was cherrypicked)
- `git simple` - a clean format for creating changelogs
- `git recent-branches` - if you forgot what you've been working on
- `git unstage` / `guns` (remove from index) and `git uncommit` / `gunc` (revert
  to the time prior to the last commit - dangerous if already pushed) aliases
- Some sensible default configs, such as improving merge messages, push only
  pushes the current branch, removing status hints, and using mnemonic prefixes
  in diff: (i)ndex, (w)ork tree, (c)ommit and (o)bject
- Slightly improved colors for diff
- `gdmb` (g)it (d)elete (m)erged (b)ranches - Deletes all branches already
  merged on current branch

#### Secret scanning with gitleaks

The gitconfig sets a global `core.hooksPath` pointing at `~/.config/git/hooks`,
where a pre-commit hook runs [gitleaks](https://github.com/gitleaks/gitleaks)
against your staged changes. **Every commit in every repo gets scanned for
secrets before it lands.** The hook chains to any project-local pre-commit hook
first, so it plays nice with repos that have their own hooks.

### Myrepos framework configuration

[Myrepos](https://myrepos.branchable.com/) is a tool to manage all your version
control repositories.

YADR provides a config framework to manage not only git repositories, but any
version control system supported by this tool. It was adapted from
[@aspiers/mr-config](https://github.com/aspiers/mr-config).

You'll have under a `.config/mr` folder:

- [`.mrconfig`](./root/dot_mrconfig.tmpl) - uses
  [`library_loaders`](./root/private_dot_config/mr/library_loaders) to load all
  the components below:
  - [`groups.d/`](./root/private_dot_config/mr/groups.d) - groups of `mr` repo
    definitions
  - [`lib.d/`](./root/private_dot_config/mr/lib.d) which contains
    - various shell snippets which get auto-loaded in the context of `mr`'s
      `lib` parameter
    - definitions of various `mr` actions and other `mr` parameters
  - [`sh.d/`](./root/private_dot_config/mr/sh.d) - various shell helper
    functions used by the files in `lib.d/`. Parts of these could be reused by
    other people, e.g.:
    - [`sh.d/git`](./root/private_dot_config/mr/sh.d/git) - various generic
      `git`-related helper functions
    - [`sh.d/git-remotes`](./root/private_dot_config/mr/sh.d/git-remotes) -
      various helper functions relating to management of git remotes

### SSH agent and identities

I've long since abandoned various schemes for keeping my `ssh` keys secret _and_
consistent across all my systems. [1password](https://1password.com/) has long
supported [an ssh agent and key management](https://www.1password.dev/ssh/agent)
inside the product. Your keys are securely held in a 1password vault and made
available to your environment through a dedicated agent. **There is no need to
store keys on disk any more**, no need to start a standalone agent, and no need
to add your keys to it. You'll see the default `IdentityAgent` line in
`${HOME}/.ssh/config`; I very strongly encourage you to use this feature of
1password.

### Developer experience enhancements

#### Tool management via mise-en-place

[mise-en-place](https://mise.jdx.dev/) is a feature rich and lightning fast
replacement for the spaghetti pile of `-env` tools we've all accumulated over
the years. Most of us have piled pyenv for python on top of rbenv for ruby on
top of jenv for java on top of nodeenv for node.js on top of tenv for terraform
on top of...

![for the love of god](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExcGkwOTA5eGQ1bjJ2a3lkbXo3N3J0eGtmamVrMzNpODgwdjRkOWJuNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UtVSXZI6ITRnXQOJXl/giphy.gif)

Make it stop.

[asdf](https://asdf-vm.com/) is a good attempt to consolidate these tools, but
everyone I know who's used asdf in the past and
[looked at mise](https://mise.jdx.dev/dev-tools/comparison-to-asdf.html) has
come away instantly convinced that mise is richer, faster, and more flexible. I
certainly did, and have moved all my tool management out of asdf and in to mise.
asdf is still supported in YADR; if you prefer to use it instead of mise,
disable the mise activation on the last lines of `${HOME}/.zshrc`. There's a
good [migration guide](https://mise.jdx.dev/faq.html#how-do-i-migrate-from-asdf)
if you'd like to make the switch.

Here's a quick demo video, from [the mise site](https://mise.jdx.dev/demo.html)

https://github.com/user-attachments/assets/f5e71dba-b758-46a1-93bb-a966dacbbc9f

There's a mise plugin for powerlevel10k in `${HOME}/.config/shell/theme.zsh`
that displays non-default tool versions on the right hand side of your prompt.
It overloads the `asdf` segment that p10k would normally display, so that's
where you'll need to look if you want asdf instead of mise in your prompt.

tip: Using mise, you can inject environment variables and secrets from
1password. See [this great tip](https://jarv.org/posts/mise-and-1password/) for
the details. For a plugin-based approach, see
[mise-env-1password](https://github.com/kujenga/mise-env-1password)

#### carapace completions

[carapace](https://carapace.sh/) is a universal completion generator: one binary
provides context-aware tab completions for 1000+ CLI tools (docker, kubectl, gh,
npm, aws, and most things you'll actually type) without hand-writing a `_foo`
completion function for each one. It's managed by
[mise](#tool-management-via-mise-en-place) (see `carapace` in
[`config.toml.tmpl`](./root/private_dot_config/mise/config.toml.tmpl), resolved
via the `aqua:carapace-sh/carapace-bin` registry backend) and wired up in
[`11_carapace.zsh`](./root/dot_zsh.after/11_carapace.zsh), guarded so it's a
no-op until `mise install` has fetched it.

Two environment variables shape how it behaves:

- `CARAPACE_BRIDGES='zsh,bash'` — for any command carapace doesn't natively
  know, fall back to zsh's own completion functions, then bash-completion's,
  instead of completing nothing.
- `CARAPACE_EXCLUDES='git'` — carapace ships a native `git` completer that would
  otherwise shadow zsh's stock `_git` and break
  [git-flow completion](#git-customizations) (`02_gitflow.zsh`'s `_git-flow`
  function and its `user-commands flow:...` zstyle depend on `_git` staying in
  charge). Everything else is fair game.

Styling lives in
[`root/private_dot_config/carapace/styles.json`](./root/private_dot_config/carapace/styles.json),
hand-mapped to Solarized Dark using the same hex palette as fzf's
`FZF_DEFAULT_OPTS` in [`10_fzf.zsh`](./root/dot_zsh.after/10_fzf.zsh).

Note that `000_env.zsh` exports `XDG_CONFIG_HOME="$HOME/.config"`. carapace
resolves its config directory via Go's stdlib, which on macOS defaults to
`~/Library/Application Support` unless this is set — everything else in this
repo already lives under `~/.config` by chezmoi convention, so this just brings
XDG-only tools (carapace, and any other Go tool you use that follows the same
rule) into line with the rest of the setup. If you have other Go CLI tools with
existing state under `~/Library/Application Support`, it's worth a quick look
there, since they'll start reading/writing under `~/.config` instead.

#### bash-my-aws

If you work on AWS from the command line,
[bash-my-aws](https://bash-my-aws.org/) is the best thing ever to happen to the
AWS cli. It's included here by default, and enabled by a `.zsh.after` script. I
wish I'd known about `bash-my-aws` at any point before I spent a month badly
implementing about 2 percent of what it does.

#### Automatic python venvs with uv, direnv, and mise

We include a coupled configuration for the combination of
[`uv`](https://docs.astral.sh/uv/),
[`direnv`](./root/private_dot_config/direnv), and
[mise](/root/private_dot_config/mise/). In
[`000_functions.zsh`](./root/dot_zsh.after/000_functions.zsh) we define
`uv-create`, which can be used to create a new `uv` environment in the directory
where it's run. `uv-create` can take two arguments: `-p`, to specify the python
version to use, and `-t`, to specify what type `(default, app, package, or lib)`
of environment you want to create. Once an environment has been created, it will
automatically be activated by direnv: **you'll never again have a bad day
because you forgot to run `source .venv/bin/activate`!**

`TODO:` I should likely enhance this so it doesn't require direnv; mise _should_
be able to handle all the tasks.

#### RubyGems

A `.gemrc` is included, with `gem: --no-document` set by default. Never again
wait for gem docs you'll never read to install.

#### Tmux configuration

`tmux.conf` provides some sane defaults for tmux like a powerful status bar and
vim keybindings. You can customize the configuration in `~/.tmux.conf.user`.
Configs for [tmuxp](https://tmuxp.git-pull.com/) session layouts and a
[workmux](https://github.com/raine/workmux) dashboard popup are also managed
under `~/.config`. See [docs/tmux/README.md](docs/tmux/README.md) for more.

![screenshot tmux](https://i.imgur.com/K7DE9Ra.png)

#### Vimization of everything

The provided inputrc and editrc will turn your various command line tools like
mysql and irb into vim prompts. There's also an included Ctrl-R reverse history
search feature in editrc, very useful in irb, postgres command line, and etc.

#### Image diffs: spaceman-diff

We include the [`spaceman-diff`](https://github.com/holman/spaceman-diff)
command. Now you can diff images from the command line.

### Editor configurations

#### A complete neovim IDE based on [LazyVim](https://www.lazyvim.org/)

Neovim is the flagship editor here. LazyVim is an enhanced distribution of
neovim that turns vim into a full fledged IDE, and I've spent a lot of time on
customizing it -- more than 30 custom plugin specs covering the dashboard, LSP
and completion, navigation, git integration, and AI tooling -- starting from an
extensive base written by
[Andrea Arturo Venti Fuentes](https://github.com/av1155/nvim). A managed
[Neovide](https://neovide.dev/) config is included for GUI use. See the
[LazyVim configuration document](/docs/nvim/README.md) for the full tour!

#### Classic vim

The traditional vim setup is still here, with more than 80 plugins managed by
vim-plug, all under one roof, working together, each plugin researched and
configured to be at its best, often with better shortcut keys:

- [Navigation - NERDTree, EasyMotion and more](docs/vim/navigation.md)
- [Text Objects - manipulate ruby blocks, and more](docs/vim/textobjects.md)
- [Code manipulation - rails support, comments, snippets, highlighting](docs/vim/coding.md)
- [Utils - indents, paste buffer management, lots more](docs/vim/utils.md)
- [General enhancements that don't add new commands](docs/vim/enhancements.md)

A list of some of the most useful commands and plugins that YADR provides in vim
are included in the [vim README](docs/vim/README.md). Spend some time looking
through this - there's a lot!

#### Extending and overriding vim settings

- [Debugging vim keymappings](docs/vim/keymaps.md)
- [Overriding vim settings with ~/.vimrc.after and friends](docs/vim/override.md)
- [Adding your own vim plugins](docs/vim/manage_plugins.md)

## Testing with Docker

We can use Docker to test changes in a **Linux** container.

Assuming your host system has Docker & Docker Compose properly installed, run:

```sh
docker compose run dotfiles
```

This will build the container image if it never built it before (which may take
a while -- future times will be faster) and then run a `zsh` session inside that
container for you. There you can play around, test commands, aliases, etc.

_Note_: the container exercises the Linux side of the config; anything
macOS-specific obviously can't be tested this way.

## Misc

- [Credits & Thanks](docs/credits.md)
- [Some recommended macOS productivity tools](docs/macos_tools.md)
- [Yan's Blog](https://yanpritzker.com)

### macOS Hacks

The macOS file is a bash script that sets up sensible defaults for devs and
power users under macOS. Read through it before running it. To use:

```sh
bin/macos
```

TODO: This is a _really_ old set of tweaks, written for MacOS Lion. Bring that
up to date.

### [Pry](https://pryrepl.org/)

Pry offers a much better out of the box IRB experience with colors, tab
completion, and lots of other tricks. You can also use it as an actual debugger
by installing [pry-nav](https://github.com/nixme/pry-nav).

[Learn more about YADR's pry customizations and how to install](docs/pry.md)

## License

MIT

[apple-logo]:
  https://img.shields.io/badge/macos-supported-blue.svg?logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABEAAAAUCAYAAABroNZJAAAABGdBTUEAALGPC%2FxhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAACAmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8ZXhpZjpQaXhlbFlEaW1lbnNpb24%2BNjY8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24%2BNTU8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4Ktkd%2F7gAAAiNJREFUOBGNUz1rG0EQ1UnRSZiDRMYmjbqAITJJpUaV22DiXxDSmYB%2FgcH%2FJFWKNCFpTH6CW0FUBKH0EVKEkC46fZ10H%2Bv35naPUyJbWpibnTezb2dn5nK5PZZSqgDJ7xG6PYQE2z17oobA87yTxWJxOxwO3%2FKowR%2BkYYCWIoMGg8GLIAi8MAwVSOrEHiSBIw%2BxGJRdURR9Aa6gPxhcx6Y1ekIHQcuyYu6n0%2BnLUqlk%2B77fbTabDm5%2FE8fxD8dxOsDOkdFvxP7cOEcCAu12216v158RhEujJeTPfD4f9Pv9eDKZLPkcYAo6ANm3Xq93ZIiYhTwBBJ8YlBX40qXxAFkp1EiNx%2BNXmiTp3mw2e61vihHMVKhlZXCcj2GGCsW%2B0gRSDvnYtn2GdxIPIdIVaAE0zn2MfQFPcVut1i1sLqmj1APOpwm2%2B4v0lp1OZ8lInFPUpk1rGjuWhQLl0LnDRqNxzFjYUg8hAbu0DPhjI06SsFgslmu12rW%2BMAImz865rvsMBeuCjN3h2uhS1jbFXa1WNyYbTmmhUqn8hfOrYdd6q2I2LDZ0VQeIIU8ajUZVZOOCjFn4kAAik6f3tH36ETdEm5%2BTBGRJXbGRVmMy33OQEJwKDqR74rTR5gtNIOeSoiSMyNJSGLx35XL5EsRTvPsOk%2FwLc3SKrtThPwDJR%2Fi%2Fw1%2BAHZFsY8GRkm44%2FjEQZ0ZDPP8dMjdowmzLza38481eSO4BM4sOer2f%2BQ4AAAAASUVORK5CYII%3D
[linux-logo]:
  https://img.shields.io/badge/linux-supported-blue.svg?logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAUCAQAAAAua3X8AAAABGdBTUEAALGPC%2FxhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAACAmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8ZXhpZjpQaXhlbFlEaW1lbnNpb24%2BNjc8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24%2BNTQ8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KcLJ2GgAAAcxJREFUGBllwU1I02EcwPHv83se3dCckcOXxRQlxKRBmaBR4MjOBQWG125FFOJB6NQLFBRd6hiEZyGhIDpECRZRhNBBoRcKmZfKynAbbv6359f21xHR58Nfatimwv%2FUwMpQ8VJ2TOtBhX%2BphdWRTfVa0NW5r42ghpCwxYCezFHeyAQN6abTgCUkbPHwI%2FmeTN1zVqgbAJSQUGWMh%2FyOF1zAmhhBF6CEhJro554mkiYjedaGx%2BPGq1AhVMwIDCWlK8WYfJRXpdb4%2BYuApUYdZG7d177gmPbruA80W3o4CDOWKrUwu3dj87L2l9N6VAd0Nijqt5dUqBFCh859qHsUxMXjCXjtNsuRw0ujgBUVU77eEju1RME6qiKsUlClLU2FLFjoPVHq%2BFRChCpLjjWiNCUBL4MBPJ04Q8p0k8XhaWQPu8lzI0H9FXEwdWdx32LpoLvLJN8BhzJhlulpVmuc%2FZl8Nr3gOv0bc8Bk9W3Z%2BuM%2BwQPJkWvPtM89cbsibdECeRfovdI1l3bNDDPNuj8izjnMhk2vt7%2FbX%2B5uaY11SrRoHv%2BeX%2F6S6NjZ0Od%2FXb05Sc1U8%2Fzo7bOkCOUTOjLaS5UB5hzCNhW1KoRUMPAHBgywCw3JeWgAAAAASUVORK5CYII%3D
[prs-badge]:
  https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAACWFBMVEXXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWko2FeWCAAAAAXRSTlMAQObYZgAAAAFiS0dEAIgFHUgAAAAJcEhZcwAAI28AACNvATX8B%2FsAAAAHdElNRQfhBQMBMCLAfV85AAAAi0lEQVQ4y2NgIBYszkPmJc5ORZE9DgEJqNxmmPS%2B43AA4h5B5TIwbD5%2BHFnoKCoXYSBMBIW7CF0eAxChoPM4ARXHB4GCZEIKKA8H%2FCoWE1LAwIBfBVp6wQA1DPhVzMJMcyggCVuqxGI%2FLhWY6Z6QPKoK7HmHkDwDwxYC8gwMdSDprXiz6PHjpQxUBgCLDfI7GXNh5gAAAABJRU5ErkJggg%3D%3D
