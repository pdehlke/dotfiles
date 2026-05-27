<!-- markdownlint-disable MD013 -->

```
 _     _           _
| |   | |         | |
| |___| |_____  __| | ____
|_____  (____ |/ _  |/ ___)
 _____| / ___ ( (_| | |
(_______\_____|\____|_|

# Yet Another Dotfile Repo v3.0
# Now with Chezmoi, zsh4humans, direnv, mise-en-place, Vim-Plug, and a complete neovim IDE!
```

# About YADR

This is a **MacOS** focused fork of @[nandalopes/dotfiles](https://github.com/nandalopes/dotfies), which is itself a
**GNU/Linux** focused fork of @[skwp/dotfiles](https://github.com/skwp/dotfiles).

`sh -c "\`curl -fsSL <https://github.com/pdehlke/dotfiles/raw/main/root/bin/yadr/install.sh> \`"\`

**Managed with [chezmoi](https://chezmoi.io/).**

This repo has been built for my own benefit, however feel free to sneak in and steal anything that would improve your
own productivity. **YADR is an opinionated dotfile repo that will make your heart sing**

- The best bits of all the top dotfile repos, vim and zsh plugins curated in one place, into a simple and cohesive way
  of working.
- More than 90 vim plugins, all under one roof, working together, each plugin researched and configured to be at its
  best, often with better shortcut keys.
- A heavily customized, developer focused ZSH environment based on [zsh4humans](https://github.com/romkatv/zsh4humans)
  with lots of extras
- All things are vimized: irb, postgres command line, etc.

*The main difference between this repo and @[nandalopes/dotfiles](https://github.com/nandalopes/dotfiles) upstream is
that MacOS is fully supported in this fork, just as it was in skwp's original work. If it doesn't work, please open an
issue or submit a PR!*

*The main difference between this repo and @[skwp/dotfiles](https://github.com/skwp/dotfiles) upstream is that I've
moved off of [prezto](https://github.com/sorin-ionescu/prezto) in favor of
[zsh4humans](https://github.com/romkatv/zsh4humans#customizing-prompt).*

Please use GitHub Issues for pull requests or bug reports only.

---

<!--toc:start-->

<details>
<summary>Table of Contents</summary>

- [About YADR](#about-yadr)
- [Screenshot](#screenshot)
- [Installation](#installation)
  - [Convenience script](#convenience-script)
  - [Manually with `git`](#manually-with-git)
  - [Manually with `chezmoi`](#manually-with-chezmoi)
  - [I already have a chezmoi repo](#i-already-have-a-chezmoi-repo)
- [Finish the install with fonts and colors](#finish-the-install-with-fonts-and-colors)
  - [Install Solarized Colors at your terminal of choice](#install-solarized-colors-at-your-terminal-of-choice)
  - [Remap caps-lock to escape with Karabiner-Elements](#remap-caps-lock-to-escape-with-karabiner-elements)
  - [Set up a system wide hotkey for iTerm](#set-up-a-system-wide-hotkey-for-iterm)
  - [In iTerm uncheck "Native full screen windows" on General](#in-iterm-uncheck-native-full-screen-windows-on-general)
  - [in MacVim uncheck "Prefer native full-screen support" under Advanced settings](#in-macvim-uncheck-prefer-native-full-screen-support-under-advanced-settings)
- [If you want to run vim in terminal](#if-you-want-to-run-vim-in-terminal)
- [Upgrading](#upgrading)
- [Whats included and how to customize](#whats-included-and-how-to-customize)
  - [Homebrew](#homebrew)
  - [ZSH](#zsh)
    - [Aliases](#aliases)
    - [Dotfiles management aliases](#dotfiles-management-aliases)
  - [Git Customizations](#git-customizations)
  - [Myrepos framework configuration](#myrepos-framework-configuration)
  - [SSH agent and identities](#ssh-agent-and-identities)
  - [Developer experience enhancements](#developer-experience-enhancements)
    - [Tool management via mise-en-place](#tool-management-via-mise-en-place)
    - [bash-my-aws](#bash-my-aws)
    - [Automatic python venvs with uv direnv and mise](#automatic-python-venvs-with-uv-direnv-and-mise)
    - [RubyGems](#rubygems)
    - [Tmux configuration](#tmux-configuration)
    - [Vimization of everything](#vimization-of-everything)
    - [Image diffs: spaceman-diff](#image-diffs-spaceman-diff)
  - [Editor configurations](#editor-configurations)
    - [Extensive neovim customization based on LazyVim](#extensive-neovim-customization-based-on-lazyvim)
    - [Whats included in vim](#whats-included-in-vim)
  - [Extending and overriding YADR settings](#extending-and-overriding-yadr-settings)
- [Testing with Docker](#testing-with-docker)
- [Misc](#misc)
  - [macOS Hacks](#macos-hacks)
  - [Macvim troubles with Lua](#macvim-troubles-with-lua)
  - [Terminal Vim troubles with Lua](#terminal-vim-troubles-with-lua)
  - [Pry](#pry)
- [License](#license)

</details>

<!--toc:end-->

---

## Screenshot

![screenshot vim](https://i.imgur.com/IhPYpNV.png)

## Installation

To get started please run:

```bash
sh -c "`curl -fsSL https://github.com/pdehlke/dotfiles/raw/main/root/bin/yadr/install.sh`"
```

**Note:** YADR will automatically install all of its subcomponents. The last thing it will do is
pre-install plugins for Sublime Text, vim, and neovim. Particularly in the case of neovim, this
may take some time, and nvim may quit before mason has finished. You can safely ignore any errors
this generates.

### Convenience script

In case of not having `chezmoi` installed - Just firing the [`root/bin/yadr/install.sh`](./root/bin/yadr/install.sh)
after a simple download of it.

### Manually with `git`

You will have to clone the repo and from its root directory, execute the `install.sh` SH script

### Manually with `chezmoi`

Leveraging Chezmoi capabilities

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

## Finish the install with fonts and colors

#### Install Solarized Colors at your terminal of choice

Change your terminal colors to Solarized. Most terminals on Linux have a solarized colorscheme installed by default.

#### Remap caps-lock to escape with [Karabiner-Elements](https://pqrs.org/osx/karabiner/index.html)

The escape key is the single most used key in vim. Old keyboards used to have Escape where Tab is today. Apple keyboards
are the worst with their tiny Esc keys. But all this is fixed by remapping Caps to Escape. If you're hitting a small
target in the corner, you are slowing yourself down considerably, and probably damaging your hands with repetitive
strain injuries.

#### Set up a system wide hotkey for iTerm (Keys=>Hotkey)

Recommended Cmd-Escape, which is really Cmd-Capslock.

#### In iTerm uncheck "Native full screen windows" on General

This will give you fast full screen windows that are switchable without switching to spaces.

#### in MacVim uncheck "Prefer native full-screen support" under Advanced settings

Same as iTerm. The native spaces navigation slows everything down for no reason.

## If you want to run vim in terminal

- Make sure you install Solarized colorscheme in your terminal!
- If you don't want to use solarized terminal, then make sure you do this:

```vim
let g:yadr_using_unsolarized_terminal = 1
" in ~/.vimrc.before
```

- If you want to use an alternate colorcheme like Gruvbox, then do this

```vim
let g:yadr_disable_solarized_enhancements = 1
colorscheme base16-twilight
" in ~/.vimrc.after
```

## Upgrading

Upgrading is easy.

```
  chezmoi update --verbose --dry-run # check updates before apply
  chezmoi apply --verbose
```

## Whats included and how to customize

Read on to learn what YADR provides!

### Homebrew

I've included my Brewfile in this repo for convenience. It's the full output of `brew bundle dump`, so it lists
_everything_ I have installed. You probably want to use it as a reference or a starting point for things you will want
to have. Off the top of my head, YADR itself depends on a few things being installed and first in your $PATH:

- fzf
- fasd (be sure to tap wyne/tap)
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

I prefer `ghostty` as my terminal; you might want `kitty` or `iTerm`. Regardless, you want to install appropriate fonts.
I prefer `MesloLGS NF`, myself, but YMMV as long as you use a font that powerlevel10k can work with.

## ZSH

Think of Zsh as a more awesome Bash without having to learn anything new. Automatic spell correction for your commands,
syntax highlighting, and more. We've also provided lots of enhancements:

- [zsh4humans - the power behind YADR's zsh](https://github.com/romkatv/zsh4humans). All previous versions of YADR that
  I am aware of are based on [Prezto](https://github.com/sorin-ionescu/prezto). Prezto is a fantastic framework, and
  Sorin is due all the praise in the world for his contributions to the `zsh` community. But over the years, `zsh`
  startup time had crept up to ~2.5 seconds on an M3 Macbook Pro with 64 GB of RAM. `zprof` showed that most of that
  time was spent loading prezto modules and zsh completions. It was time for a change, and romkatv's `zsh4humans` easily
  achieved feature parity with the old prezto setup, with a startup time of under 300 ms on the same Macbook Pro.
- Vim mode and bash style `Ctrl-R` for reverse history finder
- `Ctrl-x,Ctrl-l` to insert output of last command
- Fuzzy matching - if you mistype a directory name, tab completion will fix it
- [fasd](https://github.com/clvv/fasd) integration - hit `z` and partial match for recently used directory. Tab
  completion enabled.
- [How to add your own ZSH theme](docs/zsh/themes.md)

### Aliases

Lots of things we do every day are done with two or three charactera mnemonic aliases. Please feel free to edit them:

```
ae # alias edit
ar # alias reload
```

Do note that you'll be editing `${HOME}/.yadr/root/aliases.sh` directly. Don't forget that this file is part of the YADR
git repo; your changes will not be present on new installs unless you've forked and pushed.

If you have particularly clever aliases that you think should be in this repo, please submit a PR.

**Dotfiles management aliases**

- `czI` - chezmoi (I)init - re-generate the config file
- `czh` - chezmoi (h)ome - cd into dotfiles dir
- `cza [ file(s) | folder(s) ]` - chezmoi (a)pply - apply *source state* to *destination*. Add `--dry-run` to preview
  only.
- `czA [ file(s) | -r folder(s) ]` - chezmoi (A)dd - add files to *source state*
- `czc file(s)` - chezmoi (c)at - show *target state*, acording to *source state*
- `cze file(s)` - chezmoi (e)dit - edit a file in *source state* then apply changes. Add `--dry-run` to preview only.
- `czE` - chezmoi (E)dit-config - edit `chezmoi.yaml` configuration file
- `czf [ file(s) | -r folder(s) ]` - chezmoi (f)orget - remove a file from *source state*
- `czg` - chezmoi (g)it - run a git command on dotfiles dir
- `czu` - chezmoi (u)pdate - fetch and apply changes. Add `--dry-run` to preview only.
- `czd [ file(s) | -r folder(s) ]` - chezmoi (d)iff - compare *destination* and *target state*
- `czD` - chezmoi (D)ata - list chezmoi variables, useful for templating
- `czm file(s)` - chezmoi (m)erge - three-way merge between *destination*, *source state* and *target state*

### Git Customizations

YADR will take over your `~/.gitconfig`, so if you want to store your usernames, please put them into
`~/.gitconfig.user`

It is recommended to use this file to set your user info; the first time you install it, YADR will ask you for the name
and email address you want to use on commits. Alternately, you can set the appropriate environment variables in your
`~/.secrets`.

- `git l` or `gl` - a much more usable git log
- `git b` or `gb` - a list of branches with summary of last commit
- `git r` - a list of remotes with info
- `git t` or `gt` - a list of tags with info
- `git nb` or `gnb` - a (n)ew (b)ranch - like checkout -b
- `git cp` or `gcp` - cherry-pick -x (showing what was cherrypicked)
- `git simple` - a clean format for creating changelogs
- `git recent-branches` - if you forgot what you've been working on
- `git unstage` / `guns` (remove from index) and `git uncommit` / `gunc` (revert to the time prior to the last commit -
  dangerous if already pushed) aliases
- Some sensible default configs, such as improving merge messages, push only pushes the current branch, removing status
  hints, and using mnemonic prefixes in diff: (i)ndex, (w)ork tree, (c)ommit and (o)bject
- Slightly improved colors for diff
- `gdmb` (g)it (d)elete (m)erged (b)ranches - Deletes all branches already merged on current branch

### Myrepos framework configuration

[Myrepos](https://myrepos.branchable.com/) is a tool to manage all your version control repositories.

YADR provides a config framework to manage not only git repositories, but any version control system supported by this
tool. It was adapted from [@aspiers/mr-config](https://github.com/aspiers/mr-config).

You'll have under a `.config/mr` folder:

- [`.mrconfig`](./root/dot_mrconfig) - uses [`library_loaders`](./root/private_dot_config/mr/library_loaders) to load
  all the components below:
  - [`groups.d/`](./root/private_dot_config/mr/groups.d) - groups of `mr` repo definitions
  - [`lib.d/`](./root/private_dot_config/mr/lib.d) which contains
    - various shell snippets which get auto-loaded in the context of `mr`'s `lib` parameter
    - definitions of various `mr` actions and other `mr` parameters
  - [`sh.d/`](./root/private_dot_config/mr/sh.d) - various shell helper functions used by the files in `lib.d/`. Parts
    of these could be reused by other people, e.g.:
    - [`sh.d/git`](./root/private_dot_config/mr/sh.d/git) - various generic `git`-related helper functions
    - [`sh.d/git-remotes`](./root/private_dot_config/mr/sh.d/git-remotes) - various helper functions relating to
      management of git remotes

## SSH agent and identities

I've long since abandoned various schemes for keeping my `ssh` keys secret _and_ consistent across all my systems.
[1password](https://1password.com/) has long supported
[an ssh agent and key management](https://www.1password.dev/ssh/agent) inside the product. Your keys are securely held
in a 1password vault and made available to your environment through a dedicated agent. There is no need to store keys on
disk any more, no need to start a standalone agent, and no need to add your keys to it. You'll see the default
`IdentityAgent` line in `${HOME}/.ssh/config`; I very strongly encourage you to use this feature of 1password.

## Developer experience enhancements

### Tool management via mise-en-place

[mise-en-place](https://mise.jdx.dev/) is a feature rich and lightning fast replacement for the spaghetti pile of `-env`
tools we've all accumulated over the years. Most of us have piled pyenv for python on top of rbenv for ruby on top of
jenv for java on top of nodeenv for node.js on top of tenv for terraform on top of...

![for the love of god](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExcGkwOTA5eGQ1bjJ2a3lkbXo3N3J0eGtmamVrMzNpODgwdjRkOWJuNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UtVSXZI6ITRnXQOJXl/giphy.gif)

Make it stop.

[asdf](https://asdf-vm.com/) is a good attempt to consolidate these tools, but everyone I know who's used asdf in the
past and [looked at mise](https://mise.jdx.dev/dev-tools/comparison-to-asdf.html) has come away instantly convinced that
mise is richer, faster, and more flexible. I certainly did, and have moved all my tool management out of asdf and in to
mise. asdf is still supported in YADR; if you prefer to use it instead of mise, disable the mise activation on the last
lines of `${HOME}/.zshrc`. There's a good [migration guide](https://mise.jdx.dev/faq.html#how-do-i-migrate-from-asdf) if
you'd like to make the switch.

There's a mise plugin for powerlevel10k in `${HOME}/.config/shell/theme.zsh` that displays non-default tool versions on
the right hand side of your prompt. It overloads the `asdf` segment that p10k would normally display, so that's where
you'll need to look if you want asdf instead of mise in your prompt.

tip: Using mise, you can inject environment variables and secrets from 1password. See
[this great tip](https://jarv.org/posts/mise-and-1password/) for the details. For a plugin-based approach, see
[mise-env-1password](https://github.com/kujenga/mise-env-1password)

### bash-my-aws

If you work on AWS from the command line, [bash-my-aws](https://bash-my-aws.org/) is the best thing ever to happen to
the AWS cli. It's included here by default, and enabled by a `.zsh.after` script. I wish I'd known about `bash-my-aws`
at any point before I spent a month badly implementing about 2 percent of what it does.

### Automatic python venvs with uv direnv and mise

We include a coupled configuration for the combination of [`uv`](https://docs.astral.sh/uv/),
[`direnv`](./root/private_dot_config/direnv), and [mise](/root/private_dot_config/mise/). In
[`functions.zsh`](./root/dot_zsh.after/functions.zsh) we define `uv-create`, which can be used to create a new `uv`
environment in the directory where it's run. `uv-create` can take two arguments: `-p`, to specify the python version to
use, and `-t`, to specify what type `(default, app, package, or lib)` of environment you want to create. Once an
environment has been created, it will automatically be activated by direnv: you'll never again have a bad day because
you forgot to run `source .venv/bin/activate`!

`TODO:` I should likely enhance this so it doesn't require direnv; mise _should_ be able to handle all the tasks.

### RubyGems

A `.gemrc` is included. Never again type `gem install whatever --no-ri --no-rdoc`. `--no-ri --no-rdoc` is done by
default.

### Tmux configuration

`tmux.conf` provides some sane defaults for tmux like a powerful status bar and vim keybindings. You can customize the
configuration in `~/.tmux.conf.user`.

![screenshot tmux](https://i.imgur.com/Rlh30kg.png)

### Vimization of everything

The provided inputrc and editrc will turn your various command line tools like mysql and irb into vim prompts. There's
also an included Ctrl-R reverse history search feature in editrc, very useful in irb, postgres command line, and etc.

### Image diffs: spaceman-diff

We include the [`spaceman-diff`](https://github.com/holman/spaceman-diff) command. Now you can diff images from the
command line.

## Editor configurations

### Extensive neovim customization based on [LazyVim](https://www.lazyvim.org/)

LazyVim is an enhanced distribution of neovim that turns vim into a full fledged IDE. I've spent a lot of time on
customizing LazyVim, starting from an extensive base written by
[Andrea Arturo Venti Fuentes](https://github.com/av1155/nvim) See the
[LazyVim configuration document](/docs/nvim/README.md) for more!

### Whats included in vim

- [Navigation - NERDTree, EasyMotion and more](docs/vim/navigation.md)
- [Text Objects - manipulate ruby blocks, and more](docs/vim/textobjects.md)
- [Code manipulation - rails support, comments, snippets, highlighting](docs/vim/coding.md)
- [Utils - indents, paste buffer management, lots more](docs/vim/utils.md)
- [General enhancements that don't add new commands](docs/vim/enhancements.md)

A list of some of the most useful commands and plugins that YADR provides in vim are included in the
[vim README](docs/vim/README.md). Spend some time looking through this- there's a lot!

## Extending and overriding YADR settings

- [Debugging vim keymappings](docs/vim/keymaps.md)
- [Overriding vim settings with ~/.vimrc.after and friends](docs/vim/override.md)
- [Adding your own vim plugins](docs/vim/manage_plugins.md)

## Testing with Docker

We can use Docker to test some changes in a **Linux** Container.

Assuming your host system has Docker & Docker Compose properly installed, run:

```
docker compose run dotfiles
```

This will build the container image if it never built it before (which may take a while -- future times will be faster)
and then run a `zsh` session inside that container for you. There you can play around, test commands, aliases, etc.

*Warning*: this repo is primarily Linux oriented. So any support for macOS can only be done with the help of the
community.

## Misc

- [Credits & Thanks](docs/credits.md)
- [Some recommended macOS productivity tools](docs/macos_tools.md)
- [Yan's Blog](https://yanpritzker.com)

### macOS Hacks

The macOS file is a bash script that sets up sensible defaults for devs and power users under macOS. Read through it
before running it. To use:

```
bin/macos
```

TODO: This is a _really_ old set of tweaks, written for MacOS Lion. Bring that up to date.

### Macvim troubles with Lua

```
brew uninstall macvim
brew remove macvim
brew cleanup
brew install macvim --custom-icons --with-override-system-vim --with-lua --with-luajit
```

### Terminal Vim troubles with Lua

Installing terminal vim (with lua) with an RVM managed Ruby can cause the neocomplete plugin to segfault. Try
uninstalling vim, then installing with system ruby:

```
brew uninstall vim
rvm system do brew install vim --with-lua
```

### [Pry](https://pryrepl.org/)

Pry offers a much better out of the box IRB experience with colors, tab completion, and lots of other tricks. You can
also use it as an actual debugger by installing [pry-nav](https://github.com/nixme/pry-nav).

[Learn more about YADR's pry customizations and how to install](docs/pry.md)

## License

MIT
