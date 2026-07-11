# Changelog

## 2026-07-11

### Features

- *(functions)* Support ssh:// URLs in repo()
- *(fzf)* Override hideous pink highlight color
- *(zsh4humans)* Alias clear so prompt-at-bottom works
- *(kitty)* Solarized theme
- *(zsh)* Add zsh-startup-bench script

### Bug Fixes

- Fix(.zshrc) re-enable prompt-at-bottom
- *(zsh)* Guard unalias diff against missing alias

### Style

- *(.zshrc)* Clean up formatting

## 2026-07-10

### Features

- *(mise)* Provision corepack yarn via chezmoi script
- *(zsh)* Enable command spelling correction

### Bug Fixes

- *(mise)* Drop yarn, use corepack instead

### Other

- *(nvim)* Drop old config audit after extensive updates

### Refactoring

- *(zsh)* Fix git-flow completion bugs and rename to 02_gitflow.zsh
- *(zsh)* Fix bugs and modernize zoxide.zsh
- *(zsh)* Fix bugs in and consolidate zsh function files
- *(zsh)* Zmv.zsh was a dupe; removed it
- *(zsh)* Remove dead config, resolve duplications and contradictions

### Documentation

- *(readme)* Rewrite top-level README from repo audit
- *(nvim)* Rewrite README from 07/2026 config audit
- *(nvim)* Beautify 07/2026 config audit

### Maintenance

- *(workmux)* Increase dashboard size
- Add global .prettierrc

## 2026-07-09

### Features

- *(nvim)* Bring uv.nvim spec under chezmoi management
- (neovide): add neovide to ~/.config

### Other

- *(nvim)* Add 07/2026 analysis doc

### Refactoring

- *(nvim)* Remove duplicate and dead plugin config
- *(nvim)* Rewrite options.lua with documented settings

### Maintenance

- *(nvim)* Add .editorconfig

## 2026-07-08

### Features

- *(nvim)* Show listchars for whitespace and non-breaking spaces

### Bug Fixes

- *(zsh)* Point mise config filename to .config/mise.toml

### Maintenance

- Clean up dupes from PATH
- *(mise)* Lock checksums for java in mise.lock

## 2026-07-07

### Features

- *(tmux)* Add workmux dashboard popup binding

### Bug Fixes

- *(nvim)* Stop deletes from overwriting the macOS clipboard

## 2026-07-03

### Features

- *(workmux)* Add global config and tmux sidebar toggle

### Maintenance

- Add previously unmanaged items in ~/.config

## 2026-07-01

### Bug Fixes

- *(chezmoi)* Persist run_once script state in dotfiles-apply

### Documentation

- Require write-zsh-scripts skill for editing, not just new scripts

### Maintenance

- *(chezmoi)* Move ~/.claude and ~/.agents management to dotfiles-private

## 2026-06-30

### Features

- Disable caveman
- Update ccstatusline
- Better kitty config

### Maintenance

- *(agents)* Suppress sycophancy and trailing summaries globally

## 2026-06-29

### Bug Fixes

- *(git-hooks)* Remove --since-commit HEAD from trufflehog pre-commit scan

### Maintenance

- *(git)* Trufflehog was unreliable at secret detection. switch to gitleaks
- Option up/down for scrollback in ghostty

## 2026-06-28

### Features

- *(config)* Add ccstatusline config

### Maintenance

- Add pdehlke claude chezmoi skill

## 2026-06-27

### Refactoring

- *(chezmoi)* Convert Claude config files to symlinks

### Maintenance

- *(ghostty)* Enable copy-on-select to clipboard

## 2026-06-26

### Features

- *(claude)* Drop several unused skills

### Documentation

- *(agents)* Require domain skill load before language/style skills

### Maintenance

- *(plugins)* Remove skill-codex plugin and sync plugin state
- Add $yprivate shorthand for private dotfiles root

## 2026-06-25

### Other

- Claude sucks

### Maintenance

- Add chezmoi-settings-sync skill and restore settings template

## 2026-06-24

### Maintenance

- Set spinner to always say "Thinking"
- Add claude configs and postinstall action
- Support second dotfiles-private repo

## 2026-06-23

### Maintenance

- Minor fixes. claude does not understand yaml

## 2026-06-22

### Maintenance

- Add global pre-commit hook using trufflehog
- Pin chezmoiexternals and check hashes where possible
- Pin mise tool versions and lock checksums
- Rewrite install.sh to avoid curl | sh
- Ensure signed commits

## 2026-06-16

### Features

- *(nvim)* Better but not perfect syntax highlighting for go templates

### Maintenance

- Fix up some vim filetypes
- Dont install huge mise frameworks in containers

## 2026-06-05

### Features

- *(zoxide)* Add zoxide editor functions
- *(zoxide)* Add zoxide editor functions
- *(zoxide)* Better init; add to docker
- Migrate from fasd abandonware to zoxide

### Maintenance

- Polish fzf, zmv, and postinstall

## 2026-06-03

### Features

- Linux and macos 1passwd support in .ssh/config
- Add .zsh.after/11_fasd.zsh for linux support

## 2026-06-02

### Maintenance

- Fix du alias for linux
- Dont install huge mise frameworks
- Add peco to mise
- Polish docker image
- Don't install nvim plugins
- Docker image is now fedora
- Don't run chsh
- Linux portability and Dockerfile updates

## 2026-05-30

### Maintenance

- Update kitty tab styling

## 2026-05-28

### Other

- Merge branch 'main' of ssh://github.com/pdehlke/dotfiles

* 'main' of ssh://github.com/pdehlke/dotfiles:
  doc: better tmux screenshots
  doc: new screenshots

### Maintenance

- Simplify mise enter hook

## 2026-05-27

### Other

- Better tmux screenshots
- New screenshots

## 2026-05-28

### Other

- Badges. We need stinkin badges

## 2026-05-27

### Other

- Add a mise demo video
- Add table of contents to README.md
- Merge pull request #2 from pdehlke/feature/update-vim-docs

Feature/update vim docs
- Final README update before merge
- README updates: mise, brew, etc
- Merge branch 'feature/update-vim-docs' of ssh://github.com/pdehlke/dotfiles into feature/update-vim-docs

* 'feature/update-vim-docs' of ssh://github.com/pdehlke/dotfiles:
  doc: WIP README.md
  doc: start replacing prezto docs with zsh4humans
  docs: add comprehensive neovim plugins documentation
  doc: reorg vim/nvim docs
- WIP README.md

## 2026-05-26

### Other

- Start replacing prezto docs with zsh4humans

### Documentation

- Add comprehensive neovim plugins documentation

## 2026-05-15

### Other

- Reorg vim/nvim docs

## 2026-05-27

### Features

- Prep a better mise setup

### Other

- WIP README.md
- Start replacing prezto docs with zsh4humans
- Reorg vim/nvim docs
- Merge branch 'main' of https://github.com/pdehlke/dotfiles

* 'main' of https://github.com/pdehlke/dotfiles:
  chore: shellcheck ignores on aliases.sh

### Documentation

- Add comprehensive neovim plugins documentation

## 2026-05-26

### Maintenance

- Shellcheck ignores on aliases.sh

## 2026-05-27

### Features

- Prompt at the bottom of the screen at startup

## 2026-05-26

### Bug Fixes

- Fetch os-specific asdf instead of always using linux

## 2026-05-25

### Features

- Use 1password for ssh-agent

### Bug Fixes

- Small tweaks for z4h
- Re-add /Users/pde/.yadr/root/bin to PATH after z4h upgrade

### Maintenance

- Remove old zsh setup files

## 2026-05-24

### Features

- Initilaize nvim after first install

### Bug Fixes

- Drop z4h diff alias when color git diff works
- Re-templatize .zshrc and add p10k mise plugin

### Refactoring

- *(zsh)* Move from prezto to zsh4humans

## 2026-05-23

### Maintenance

- Refactor lualine
- Refactor aliases
- Refactor fzf

## 2026-05-16

### Maintenance

- Refactor nvim lualine config

## 2026-05-15

### Features

- Add AI skills
- Add python version to nvim/lualine

## 2026-05-14

### Features

- Better approach to nvim/direnv
- Nvim load direnv very early so plugins have access to the env
- Add direnv status indicator to lualine

### Bug Fixes

- Use modern direnv status --json for checking allowed state

### Other

- Merge pull request #1 from pdehlke/feature/add-direnv-lualine

Feature/add direnv  status to lualine

## 2026-05-13

### Features

- Massive LazyVim update

## 2026-05-11

### Features

- Nvim updates and uv support with direnv and mise

## 2026-05-05

### Maintenance

- Add .editorconfig
- Add ghostty config

## 2026-04-28

### Maintenance

- Tweak Lazyvim a bit

## 2026-04-26

### Maintenance

- Add a few small LazyVim options

## 2026-04-25

### Maintenance

- Add LazyVim config

## 2026-04-15

### Maintenance

- Better color management in fzf-tab-completion

## 2026-04-08

### Maintenance

- Update p10k and java version
- Add bash-my-aws

## 2026-04-05

### Maintenance

- *(adHoc)* Small vim improvements and stop installing python 2

## 2026-04-03

### Features

- *(adHoc)* Set default branch to 'main' and update README

## 2026-04-02

### Other

- Update 01_version_managers.zsh

### Maintenance

- *(adHoc)* Make nproc determination portable in private_dot_config/mr/groups.d/00-personal.tmpl
- *(adHoc)* Revert changes to install.sh
- *(adHoc)* Update .tmux.conf
- *(adhoc)* Bump default python 3.9
- *(adhoc)* Allow chezmoi to run from ansible more than once
- *(adhoc)* Set defaults for version managers
- *(adhoc)* Force jenv to set JAVA_HOME
- *(adhoc)* Don't init chezmoi; we do that in ansible
- *(adhoc)* Delete accidental gh token :(
- *(adhoc)* Add p10k instant prompt config
- *(adHoc)* Fix up postinstall
- *(adHoc)* Fix up defaults
- *(adHoc)* Don't manage sublime
- *(adHoc)* Set up screen and tmux
- *(adHoc)* Set up vim
- *(adHoc)* Add .pyversion
- *(adHoc)* Set up p10k
- *(adHoc)* Set up vim/sublime the chezmoi way
- *(adHoc)* Set up vim/sublime the chezmoi way
- *(adHoc)* Update .gitconfig

## 2026-02-11

### Bug Fixes

- *(cli)* Fzf install from source

## 2026-02-10

### Features

- *(zsh)* Load gpg plugins

### Bug Fixes

- *(zsh)* Keep prezto folder permissions

### Refactoring

- *(git)* Absolute paths in mrconfig

### Style

- Config files

## 2025-12-17

### Refactoring

- *(chezmoi)* Use direct url when possible

## 2025-09-12

### Features

- *(cli)* Improve ripgrep file types
- *(cli)* Improve direnv sample config

## 2025-05-15

### Testing

- *(ci)* Change runners' sequence

## 2025-04-21

### Features

- *(termux)* Enable ssh-agent plugin
- *(cli)* Fzf CTRL-T preview config

### Bug Fixes

- *(chezmoi)* GitHub rate limit exceeded
- *(cli)* No direnv version
- *(cli)* `asdf not found` in install

### Refactoring

- *(git)* Gitstatus config

### Style

- *(git)* Gitstatus permissions

### Maintenance

- *(git)* Remove asdf repository

## 2025-03-22

### Features

- *(cli)* Asdf-nodejs plugin

### Bug Fixes

- *(cli)* Android asdf arch

## 2025-02-20

### Features

- *(chezmoi)* Extra aliases
- *(git)* Extra aliases config file
- *(cli)* Direnv use_asdf lib

### Performance

- *(ci)* Chezmoi data command
- *(cli)* `.chezmoiscripts/plugins_asdf-vm.sh`
- *(chezmoi)* Default config is `verbose=true`

## 2025-02-15

### Bug Fixes

- *(cli)* Don't add `$ASDF_DATA_DIR/bin` in path
- *(cli)* Termux-exec error with `/bin/bash`
- *(cli)* Asdf arch error
- *(cli)* Asdf commands
- *(cli)* Android error

### Maintenance

- Remove unused file
- *(desktop)* Kitty extra config
- *(cli)* Update asdf-vm
- *(desktop)* Update kitty default config

## 2024-11-30

### Performance

- *(chezmoi)* Ignore fontconfig `.uuid` files

### Testing

- *(ci)* Same tests on github and gitlab

## 2024-11-13

### Bug Fixes

- YADR post install script

## 2024-10-23

### Features

- *(git)* Useful aliases

## 2024-10-09

### Features

- Repeat `chsh` when SO upgrades
- New `gitHubLatestReleaseAssetURL` function

## 2024-08-26

### Features

- *(git)* Keep `bin/fzf` file

### Bug Fixes

- *(docker)* Rename cache

### Testing

- *(ci)* Use multiple ubuntu lts versions

### Maintenance

- Enable trailing whitespaces in p10k files

## 2024-06-25

### Maintenance

- *(docker)* Legacy ENV structure warning

## 2024-06-23

### Features

- *(docker)* Improvements in Dockerfile
- *(docker)* Improvements in compose settings
- *(zsh)* Additional directories to zsh modules

### Bug Fixes

- *(git)* Gitstatusd post_make action
- *(git)* Gitstatusd file permissions

### Style

- *(chezmoi)* External list

### Maintenance

- *(desktop)* Update kitty sample config

## 2024-03-17

### Bug Fixes

- *(desktop)* External dict to nerdfonts

### Maintenance

- *(tmux)* Default to xsel on linux

## 2024-01-28

### Bug Fixes

- *(chezmoi)* Skip pager when applying changes

## 2024-01-01

### Features

- *(desktop)* Don't exclude Mono fonts

## 2023-12-12

### Features

- Migrate from old yadr

### Documentation

- Update docker compose command
- Review README*.md

### CI

- Enable workflow_dispatch event

## 2023-12-11

### Bug Fixes

- PromptChoiceOnce not found

### Maintenance

- Repository mailmap

## 2023-12-06

### Features

- *(desktop)* Set syntax hightlight kitty theme

### Performance

- *(git)* Modularize git config files
- *(git)* Gitconfig template

### Style

- Chezmoi aliases

### Maintenance

- *(zsh)* Update zpreztorc

## 2023-11-26

### Bug Fixes

- Tmux prefix used in this dotfiles

## 2023-11-24

### Bug Fixes

- *(zsh)* Disable oh-my-zsh update warning
- *(cli)* Fzf helper to clean asdf versions

### Performance

- *(git)* `color.ui=auto`
- Android related templates

### Maintenance

- *(desktop)* Update kitty config

## 2023-10-09

### Features

- *(git)* Present_exe skipper

### Performance

- *(cli)* Fzf tmuxp helper

### Documentation

- *(desktop)* Kitty terminal config

### Style

- *(zsh)* Indent_size=2
- *(zsh)* Zpreztorc quote vars

## 2023-09-11

### Performance

- *(git)* Profiles of dotfiles and fzf
- *(desktop)* Kitty.conf

### Refactoring

- PromptChoice color theme

## 2023-09-01

### Performance

- *(git)* Add absolute paths to config

## 2023-08-21

### Performance

- *(git)* Myrepos profile cleanups

## 2023-07-25

### Maintenance

- *(ruby)* Gemrc

## 2023-07-22

### Maintenance

- *(desktop)* Organize kitty externals

## 2023-07-20

### Bug Fixes

- *(git)* Debug skippers

### Maintenance

- *(zsh)* Update powerlevel10k config v1.19.0

## 2023-07-17

### Features

- Add support to light Solarized and Gruvbox
- *(desktop)* Move kitty Dracula.conf theme
- *(chezmoi)* Split chezmoidata in files

### Bug Fixes

- *(cli)* Ripgrep vim settings files

### Performance

- *(cli)* Asdf-direnv template

### Documentation

- *(zsh)* Asdf glob patterns in p10k prompt

### Maintenance

- *(desktop)* Kitty font config
- *(desktop)* `kitty 0.29.1` default config
- *(desktop)* Kitty config and themes

## 2023-07-02

### Bug Fixes

- *(android)* Termux font

## 2023-06-25

### Features

- *(zsh)* Chezmoi shell prompt segment

### Refactoring

- *(cli)* Asdf zsh loading
- Drop use of `which` in scripts

## 2023-06-19

### Maintenance

- *(zsh)* Update docs, nerdfonts-v3

## 2023-06-17

### Maintenance

- Cleanup `.keep` files

## 2023-06-14

### Maintenance

- List font folders

## 2023-06-13

### Features

- *(docker)* `.dockerignore`

### Refactoring

- *(ci)* Gitlab-ci rewrite

### CI

- Use $MY_CHEZMOI_BIN as chezmoi path

## 2023-06-10

### Maintenance

- *(desktop)* Kitty.conf

## 2023-06-07

### Bug Fixes

- *(chezmoi)* Scripts in termux

### Style

- *(chezmoi)* `post_install_yadr.sh` script
- *(git)* Dotfiles and fzf profiles

### Maintenance

- *(desktop)* Kitty.conf

## 2023-06-06

### Features

- *(desktop)* Add kitty.conf.orig

### CI

- Fix gitlab runner

## 2023-06-05

### Features

- Allow install yadr on termux
- *(vim)* Always open fugitive on top

### Bug Fixes

- *(git)* Silent default third_party_skipper
- *(zsh)* Prompt resize in kitty terminal

### Refactoring

- *(git)* Myrepos profiles
- *(desktop)* Kitty `current-theme.conf`
- *(git)* Mrconfig framework

### Style

- *(cli)* Fzf exclude shells list
- Fix indentation in override/theme.zsh

### CI

- Fix gitlab rules

### Maintenance

- *(desktop)* Kitty terminal current theme
- *(zsh)* Rename customization dirs
- *(vim)* Vimscript linting
- *(git)* Use https by default

## 2023-05-24

### Maintenance

- *(zsh)* Template `~/.zpreztorc`

## 2023-05-22

### Features

- *(vim)* Fzf grep maps

### Documentation

- *(zsh)* Powerlevel10k options
- *(git)* Style mailmap file

### CI

- Allow gitlab runs trigged from glab cli

### Maintenance

- *(zsh)* `egrep` to `grep -E`

## 2023-05-21

### Bug Fixes

- *(vim)* Remove xterm-direct code

### Maintenance

- *(zsh)* Update p10k to nerd-fonts-v3

## 2023-05-19

### Features

- *(vim)* Allow kitty keyboard protocol
- *(vim)* Allow kitty keyboard protocol
- *(git)* Write mergetools files to temp folder
- *(desktop)* Nerd fonts external code

### Performance

- *(zsh)* Faster loading

### Maintenance

- *(vim)* Update Inconsolata font name
- *(git)* Change mrtrust default content
- *(chezmoi)* Init template
- Add mailmap file

## 2023-05-12

### Features

- Chezmoi init template

### Bug Fixes

- Debconf DEBIAN_FRONTEND noninteractive

### Other

- Create `.gitlab-ci.yml` file

## 2023-05-10

### Features

- *(desktop)* Update external url

## 2023-05-03

### Features

- *(desktop)* Update nerdfonts url to v3

### Refactoring

- *(cli)* Asdf direnv setup
- *(cli)* Asdf install script

### Maintenance

- *(tmux)* Yadr print tmuxp profile

## 2023-05-01

### Bug Fixes

- *(tmux)* .param.monitor not found

## 2023-04-28

### Refactoring

- *(chezmoi)* GitHubLatestRelease

### Documentation

- *(zsh)* Powerlevel10k wizard option list

### Maintenance

- *(cli)* FZF_ALT_C_OPTS with FZF_PREVIEW_LINES

## 2023-04-21

### Features

- *(cli)* Use full query in fzf ftmux helper
- *(desktop)* Kitty config template

### Bug Fixes

- *(tmux)* Search tmux in $PATH before call
- *(cli)* Newer asdf without lib/asdf.sh wrapper
- *(desktop)* Fonts with Mono in the name

### Style

- Cosmetic and linting
- *(chezmoi)* Init template

### Maintenance

- *(desktop)* Remove transparent bg in kitty

## 2023-04-19

### Bug Fixes

- *(cli)* FZF_CTRL_T_COMMAND without dirs

## 2023-04-17

### Features

- *(tmux)* Sample tmuxp profile
- *(cli)* Chezmoi zsh completions

### Bug Fixes

- *(tmux)* Use xclip by default

### Performance

- *(chezmoi)* Reduce usage of lookPath

### Style

- *(cli)* Fzf configuration

### Maintenance

- *(desktop)* Nerd fonts initial version 2.3.3

## 2023-04-03

### Features

- *(cli)* Improve fzf default env vars

### Performance

- *(cli)* Fzf fasd helpers

### Style

- *(cli)* Fzf env vars and helpers

## 2023-04-02

### Other

- 💎 style: linting and formating

## 2023-04-01

### Features

- *(tmux)* Add P binding to switch through panes

### Style

- *(zsh)* Asdf load

## 2023-03-27

### Refactoring

- *(git)* Main mr profiles

## 2023-03-24

### Style

- *(chezmoi)* Templates
- *(git)* Personal profile options

## 2023-03-23

### Features

- *(tmux)* Linux copy programs

### Bug Fixes

- *(git)* Gitignore patterns

### Documentation

- *(desktop)* Kitty sample font-features

## 2023-02-05

### Features

- *(chezmoi)* Umask option sample

### Refactoring

- Update CI workflow

## 2023-02-03

### Refactoring

- *(git)* Rename myrepos bundleall action

### Documentation

- *(zsh)* List `p10k configure` wizard options

### Style

- *(chezmoi)* Init template

### Maintenance

- *(desktop)* Kitty terminal config

## 2022-12-16

### Features

- *(git)* Myrepos fzf config
- *(chezmoi)* Cache gitHubLatestRelease info

### Refactoring

- *(chezmoi)* External kitty dracula themes

### Style

- *(chezmoi)* Prezto clone args order
- *(chezmoi)* Lines in chezmoidata.yaml

### Maintenance

- *(cli)* Cleanup direnvrc template

## 2022-12-06

### Features

- *(desktop)* Sample kitty layout list
- *(chezmoi)* Gvim as command example in config

### Refactoring

- *(git)* Gitignore
- *(git)* Vim related ignore patterns
- Check if running interactive

### Style

- *(git)* Vim modeline on gitconfig template

### Maintenance

- *(chezmoi)* Use `.param.interactive`

## 2022-12-02

### Refactoring

- *(docker)* DEBIAN_FRONTEND=Noninteractive

### Style

- *(zsh)* Update ~/.p10k.zsh
- *(chezmoi)* Init template

## 2022-11-22

### Refactoring

- .chezmoi.yaml.tmpl

### Style

- Chezmoiexternal
- Dockerfile

### Maintenance

- *(docker)* Remove ENV CODESPACES layer

## 2022-11-18

### Features

- *(git)* No pager in branch and stash cmds

### Style

- *(docker)* Apt installs in Dockerfile

## 2022-11-12

### Features

- *(desktop)* Update kitty solarized themes

### Refactoring

- *(vim)* Solarized colors

### Documentation

- *(chezmoi)* Init config samples

### Style

- *(zsh)* Use direct powerlevel10k config file

### Maintenance

- *(chezmoi)* Chezmoiignore

## 2022-11-11

### Other

- Merge from 'upstream'

Merge branch 'back2skwp'

* back2skwp:
  Swap out to better jsx plugin that doesnt mess up js formatting
  Add javascript friendly options

## 2022-11-09

### Other

- Merge pull request #881 from skwp/yp/fix-jsx

Swap out to better jsx plugin that doesnt mess up js formatting
- Swap out to better jsx plugin that doesnt mess up js formatting
- Merge pull request #880 from skwp/yp/javascript

Add javascript plugins
- Add javascript friendly options

## 2022-10-28

### Features

- *(desktop)* Kitty allow remote control
- *(chezmoi)* Use nproc output

### Refactoring

- *(tmux)* Terminal settings
- *(git)* Gitignore files

### Documentation

- *(desktop)* Add kitty-direct comment
- *(chezmoi)* Vim modeline

### Style

- *(chezmoi)* Zlogout messages

### Maintenance

- *(vim)* Vimscript linting

## 2022-10-27

### Features

- *(cli)* Alias to `chezmoi init`

## 2022-10-19

### Bug Fixes

- *(desktop)* Kitty diff.conf inconsistent state

## 2022-10-13

### Features

- *(desktop)* Kitty diff config
- *(desktop)* External Dracula kitty theme

### Style

- *(chezmoi)* Use backticks as delimiters

## 2022-10-05

### Documentation

- *(vim)* Git log browser command

### Testing

- *(docker)* Cleanup Dockerfile

## 2022-09-30

### Features

- Allow configure light colorschemes variants
- *(vim)* Add sample maplocalleader setting

### Bug Fixes

- *(vim)* Don't overwrite fugitive mapping `,gd`

### Refactoring

- *(chezmoi)* Nerd fonts external
- *(chezmoi)* Ignore patterns

### Style

- *(vim)* Indent search plugin settings
- *(chezmoi)* Format templates

### Maintenance

- *(git)* Template builds sh helper

## 2022-09-29

### Bug Fixes

- *(docker)* `~/.vim` symlink

### Other

- ♻️ refactor(chezmoi): fix chezmoiexternal template
- ♻️ refactor(docker): setting volumes

## 2022-09-28

### Features

- *(desktop)* Kitty terminal config

### Refactoring

- *(chezmoi)* Nerd Fonts externals

## 2022-09-24

### Features

- *(desktop)* Nerd Fonts as externals

### Style

- *(chezmoi)* Comment Prezto

### Maintenance

- *(desktop)* Cleanup Nerd Fonts files

## 2022-09-22

### Testing

- *(docker)* Use volumes instead of bind mounts

## 2022-09-13

### Features

- *(git)* General_build shell helper
- *(chezmoi)* Chezmoi init template
- *(vim)* Grep mappings
- *(vim)* Use Files command to preview files

### Bug Fixes

- *(vim)* Plugin-search maps
- *(vim)* Strip_trailling_whitespace false

### Refactoring

- *(chezmoi)* .chezmoiignore list

### Documentation

- Vim plugin management

### Style

- *(vim)* RipGrep comments

## 2022-09-12

### Style

- *(vim)* Move modeline

## 2022-09-11

### Other

- ✨ feat(vim): close buffers if not listed
- ✨ feat(vim): use gv.vim instead of gitv
- 📝 docs(vim): template comments
- 💎 style(git): asdf update and post_checkout
- 📝 docs(cli): fzf install docs

### Maintenance

- *(chezmoi)* Use sourceDir in init template

## 2022-09-02

### Other

- 🐛 fix(git): disable default make mr action
- 🧪 test(docker): use binds to prezto and vim-plug
- 🧪 test(docker): skip copying vim/plugged dir
- 🐛 fix(cli): provide asdf + direnv install

- clone and update asdf
- add direnv plugin
- setup latest direnv
- remove lookPath dependant template code
- ✨ feat(cli): install fzf on xdg config folder
- 🧹 chore(cli): remove fzf.zsh file

## 2022-07-30

### Features

- *(vim)* Fix vim-plug autoinstall
- *(docker)* Prezto and plugged volumes

### Testing

- *(docker)* Dependency install layers

### Maintenance

- *(cli)* Asdf release version

## 2022-07-29

### Features

- *(chezmoi)* Prompt once init functions

## 2022-07-28

### Refactoring

- *(git)* Prezto update with modules
- *(chezmoi)* Init template

## 2022-07-27

### Features

- *(chezmoi)* Use sh install script

## 2022-06-21

### Features

- *(cli)* Fzf asdf helpers
- Add ~/.rgignore
- *(fzf)* Fkill a proccess
- *(fzf)* Improve commands
- *(zsh)* Update zpreztorc comments
- *(git)* Set mergetool.{tool,guitool}
- *(git)* Lib improvements
- *(vim)* Add tags path inside .git
- *(vim)* Close fugitive windows

### Bug Fixes

- *(tmux)* Minimal version for terminal-features
- *(vim)* Fugitive head
- Better direnv support
- *(chezmoi)* Remove after scripts `exit 0`

### Refactoring

- *(vim)* Fzf plugin settings

### Style

- *(chezmoi)* Newlines, quotes, trailing spaces
- *(vim)* Vim-vint linting

### Testing

- *(docker)* Cleanup layers
- *(docker)* Improve non-interactive install
- *(docker)* Allow ignore cached copy

### Maintenance

- *(zsh)* $yadr/aliases.sh file

## 2022-06-08

### Maintenance

- *(chezmoi)* Move editorconfig file

## 2022-06-03

### Features

- *(chezmoi)* New aliases

### Refactoring

- *(chezmoi)* Init template

### Documentation

- Fix paths on README
- Chezmoi specific aliases

### Style

- *(docs)* Keep linebreaks consistent

### Testing

- *(ci)* Fix unsafe repository error
- *(docker)* Fix act local testing
- *(ci)* Check git status

## 2021-10-20

### Other

- Use YAML as format for chezmoi config template (#7)

## 2021-10-19

### Other

- Merge pull request #5 from chezmoi/refactor-chezmoi-template

Use new default argument of prompt functions
- Add .github to ignore
- Remove uneeded codespaces check

As stdinIsATTY seems to cover it.

Refs https://github.com/twpayne/chezmoi/issues/1535\#issuecomment-946277333
- Use new default argument of prompt functions
- Merge pull request #4 from nandalopes/patch-1

Refactor chezmoi config template

## 2021-10-15

### Other

- Simplify recreate config file

## 2021-10-14

### Other

- Read previous filled data
- Move data initialization to top

## 2022-06-03

### Features

- *(vim)* Zoom pane and tmux-navigator
- *(zsh)* Prezto improvements

### Bug Fixes

- Check if there is ZSH installed
- *(chezmoi)* Chezmoi bin install path

### Maintenance

- Kitty-terminal belongs to mine branch
- Remove Rakefile

## 2022-05-31

### Other

- Move chezmoiversion file

## 2022-05-29

### Bug Fixes

- *(chezmoi)* Version with git-repo external

### Other

- Move files to chezmoi root folder

### Documentation

- README and friends out of chezmoiroot

## 2022-04-18

### Testing

- Remove some apps from original Dockerfile

### Maintenance

- *(git)* Remove .gitmodules

## 2022-04-08

### Bug Fixes

- *(chezmoi)* Post_install_yadr template

### Other

- Chmod bin/yadr/install.sh

### Refactoring

- .chezmoiignore folder patterns

### Maintenance

- Add create attribute to direnvrc

## 2022-04-07

### Features

- *(git)* Update ignore patterns

### Bug Fixes

- *(shell)* Update asdf and asdf-direnv setup

## 2022-04-03

### Other

- Migrate prezto to chezmoiexternals

remove prezto submodule

## 2022-02-27

### Other

- (2022-02-27) Prezto

## 2022-01-14

### Features

- *(shell)* Chezmoi aliases

### Bug Fixes

- *(chezmoi)* Prevent modify targets on install

### Testing

- Remove create template tests

## 2021-12-14

### Features

- *(vim)* Detect es6 files as javascript
- *(vim)* Set more useful path

## 2021-12-13

### Features

- *(vim)* New fugitive maps

### Maintenance

- Various improvements

## 2021-11-29

### Bug Fixes

- Ignore both README and README-pt files

### Style

- *(chezmoi)* Move scripts

## 2021-11-24

### Other

- Merge branch 'RoyMusthang/master'

* RoyMusthang/master:
  links de seleção de linguagem
  arrumando sintaxe de códigos
  readme principal finalizado
  solarize
  instalação traduzida
  Instalação traduzida
  iniciando projeto

### Documentation

- Portuguese README version

## 2021-10-20

### Other

- Merge pull request #4 from RoyMusthang/translation-to-portuguese

Translation to portuguese
- Links de seleção de linguagem
- Arrumando sintaxe de códigos
- Merge pull request #3 from RoyMusthang/translation-to-portuguese

readme principal finalizado
- Readme principal finalizado
- Merge pull request #2 from RoyMusthang/translation-to-portuguese

Translation to portuguese
- Solarire
- Instalação traduzida
- Instalação traduzida
- Merge pull request #1 from RoyMusthang/translation-to-portuguese

[Roy Musthang] Translation Readme
- Iniciando projeto

## 2021-11-17

### Other

- (2021-11-17) Prezto

## 2021-11-10

### Features

- *(tmux)* Check version with semverCompare

### Testing

- Avoid vim plug install error

## 2021-10-23

### Other

- Update README.md

Move spaceman-diff link

## 2021-10-18

### Features

- *(chezmoi)* Use onchange scripts

### Bug Fixes

- *(scripts)* Instruction to re-run script

## 2021-10-17

### Features

- Move chezmoi scripts to bin/scripts

## 2021-10-14

### Other

- Change vim color
- Refactor chezmoi init template

## 2021-10-12

### Features

- Install direnv config
- Install ASDF version manager

### Bug Fixes

- *(chezmoi)* Avoid trying to clone asdf twice

### Other

- Set chezmoi minimal version to 2.7.0
- Change chezmoi config template extension to yaml

### Testing

- *(docker)* Assume yes on PlugInstall
- *(docker)* Install direnv as a dependency
- *(docker)* Split dependencies installation
- *(CI)* Check `create_` files

## 2021-10-09

### Features

- Add custom diff colors in Kitty Terminal
- Add Kitty Terminal conf

### Style

- *(chezmoi)* Format yaml data

## 2021-10-08

### Other

- Move user data to ~/.gitconfig.user #4

### Style

- *(zsh)* Zlogout template

## 2021-09-28

### Bug Fixes

- *(tmux)* Check terminal-features support

## 2021-09-27

### Features

- *(git)* Add a template commit message

## 2021-09-24

### Other

- Add modeline to FZF shell functions
- Change chezmoi aliases

## 2021-09-16

### Features

- *(chezmoi)* Move dotfiles
- *(zsh)* Customize logout sayings
- *(shell)* Move aliases #8
- *(fzf)* Integrate fzf with zsh #7
- *(tmux)* Move tmux-navigator conf to template
- *(tmux)* Choose color on chezmoi init
- *(chezmoi)* Implement theme color param #3
- *(chezmoi)* Chezmoi aliases czcd, czed and czap
- *(git)* Create mrtrust if not exists
- *(zsh)* Lighter powerlevel10k prompt
- *(git)* Diff images from command line
- *(git)* (l)ist (a)ll git aliases
- *(git)* Config improvements
- *(git)* Move gitignore to XDG_CONFIG_HOME
- *(vim)* Add leader maps on Linux
- Post_install script
- *(tmux)* Copy to system clipboard
- Add empty ~/.hushlogin
- *(tmux)* Use include on template
- *(tmux)* Improve generated tmux.conf
- *(git)* Gitignore is an actual file
- *(git)* Mergetool is gvimdiff
- *(vim)* Facilitate nvim migration
- Use email and name template data
- *(vim)* SessionManage maps
- *(vim)* Tag jumping maps
- *(tmux)* Extra terminal overrides
- *(vim)* ,gs opens fugitive git status
- *(vim)* Augroup fugitive
- *(vim)* Builtins enabled
- *(vim)* More NERDTree settings
- *(vim)* Plugin eunuch
- *(vim)* Vim sessions
- *(vim)* Fzf.vim
- *(vim)* Enable mouse actions
- Myrepos config framework
- *(zsh)* Asdf prezto overrides
- *(zsh)* Overwrite powerlevel10k settings
- *(zsh)* Powerlevel10k prompt
- *(zsh)* Asdf aliases
- *(tmux)* Dracula theme
- Use $yadr in extra prompts path
- Use $yadr in path
- *(vim)* Appearance improvements
- Yadr install with chezmoi
- Nerd Fonts Complete

### Bug Fixes

- Vimscript comments on README
- *(git)* Config spaceman-diff tool
- *(tmux)* Solarized change brblack to colour234
- *(vim)* Extra linux keymaps
- *(vim)* Colors on terminal
- Fix neovim tmux check

https://github.com/neovim/neovim/issues/7353#issuecomment-334279343
- *(vim)* Tcomment on terminal
- *(vim)* Highlights after colorscheme apply
- *(vim)* Remove gist-vim
- *(vim)* Fzf commands on linux
- *(vim)* Gvim and gundo
- *(vim)* Use nerd fonts symbols on vim
- Html preview on Linux
- Fix chezmoiignore by OS

### Other

- Zsh dot_aliases
- Linting vimfiles
- Avoid `ls: illegal option -- -`

Under certain configurations with coreutils installed via brew, you may see this in shells started inside tmux:

ls: illegal option -- -
usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]

This is a known issue in prezto: https://github.com/sorin-ionescu/prezto/issues/966

Modify zsh/prezto-override/zpreztorc to make that go away.
- Keep chezmoitemplates folder
- Enable focus event on tmux
- Ag and ripgrep configs

- agignore config file
- ripgrep search .chezmoitemplates here
- Docker testing
- Powerlevel10k initial setup
- Commented useful settings
- Yaml chezmoi config template
- Remove nvalt alias

BREAKING CHANGE
- Remove yadr plugin helpers

BREAKING CHANGE
- Homebrew port README.md
- YADR 2.0 with Chezmoi, Prezto and Vim-Plug

fixup docs: chezmoi managed in README

Update README with chezmoi info
- Install chezmoi inside Yadr
- Migrate to vim-plug
- Move setupWrapping to autoload/lib.vim
- Add vim helpers
- Group snipmate plugins
- Vundle fixes

- Update some plugin names
- Use single quotes
- Install patched fonts

Even with old powerline symbols
- Fix chrome web inspector fonts to be readable

http://blog.dotsmart.net/2011/09/30/change-font-size-in-chrome-devtools/
- Initial vimfiles

Fix vimfile paths
- Install vimrc

squash basic ignores
- Install git configs
- Zsh extra folders
- Link prezto runcoms
- ZSH basic install
- Upgrade prezto
- Merge 'chezmoi/dotfiles'

* chezmoi/master:
  Run CI on all pushes and pull requests
  Set sourceDir in config file
  Improve chezmoi template sample (#1)
  Set up continuous integration (#2)
  Initial commit
  Add LICENSE

### Refactoring

- *(vim)* Vim-vint linting
- *(vim)* Group autocmds
- *(tmux)* Use templates for colorschemes
- *(vim)* Modularize settings

### Documentation

- *(tmux)* From @lfilho/dotfiles
- MacOS warning
- Restyle README
- Update credits and thanks
- Myrepos reference
- Solarized screenshots
- Customizing powerlevel10k prompt

### Style

- *(chezmoi)* Use joinPath helper
- Fix mixed indent
- *(tmux)* Square before session name
- *(vim)* Move settings to after/highlight
- *(vim)* Hide ~ for blank lines
- *(vim)* Main settings with comments aligned
- *(vim)* Relative number and mouse support
- *(vim)* Main settings
- *(vim)* Appearance bundle
- *(vim)* Languages bundle
- Style git modules
- *(vim)* Plugin load alternative

### Testing

- *(docker)* Add default programs
- *(CI)* Update CI

### Maintenance

- Relative paths in README
- *(chezmoi)* Tmux colors on template folder
- *(vim)* Change ignore regex
- *(tmux)* Move copy-mode bind
- Dotfiles maintanance
- Trailing whitespace
- Toggle neocomplete
- *(vim)* Search bundle
- *(vim)* Cleanup plugin-grep.vim
- *(vim)* Change deprecated plugins
- *(vim)* Wrapping maps
- *(vim)* Use leader on maps
- *(vim)* Use leader on maps
- *(vim)* Splitjoin maps
- *(vim)* Tabularize maps
- *(vim)* TComment maps
- *(vim)* NERDTree maps
- *(vim)* Yankring maps
- *(vim)* Ag search maps
- *(vim)* Remove CtrlP
- *(vim)* Remove deprecated ag.vim
- *(vim)* Use wordmotion
- *(vim)* Plugins
- Headers and license
- Rename doc{,s}
- Cleanup .gitignore
- *(vim)* Remove vim after plugin
- *(vim)* Use lib.vim helper
- *(vim)* Rename improvements bundle
- *(zsh)* Sane git aliases
- Sane aliases
- *(zsh)* Use sourceDir for $yadr
- *(vim)* Vundles management
- *(vim)* Follow name conventions
- *(chezmoi)* Ignore YADR files

## 2020-09-12

### Other

- Run CI on all pushes and pull requests

## 2020-08-29

### Other

- Set sourceDir in config file

## 2020-08-23

### Other

- Improve chezmoi template sample (#1)

## 2020-08-22

### Other

- Set up continuous integration (#2)
- Initial commit
- Add LICENSE

## 2021-03-11

### Other

- Merge pull request #861 from joaomarcos96/master

add snipmate settings

## 2021-02-03

### Other

- Add snipmate settings

## 2020-12-15

### Other

- Merge pull request #851 from nandalopes/prezto-install

prezto_install rake task

## 2020-11-26

### Other

- Remove zshrc post-install inserts
- Zshrc override
- Install directly prezto-override

(cherry picked from commit d7eaeed726edc936b18aebcc0df1fcd3670c4edd)

## 2020-12-15

### Features

- *(test)* Ubuntu Bionic Beaver docker

### Bug Fixes

- Fix(test) interactive rake install

<https://serverfault.com/a/797318/78829>

### Other

- Merge pull request #858 from nandalopes/test-docker

feat(test) improvements on test files
- Fix apt error
- Merge pull request #853 from nandalopes/upd-vim-tmux

Update vim-tmux conf

## 2020-11-16

### Other

- Copy-mode-vi key binds
- Update tmux-vim configuration

<https://github.com/christoomey/vim-tmux-navigator/blob/master/README.md#tmux>

## 2020-12-15

### Other

- Merge pull request #847 from plribeiro3000/jazz_fingers

feat(*): Colorized irb prompt

## 2020-10-26

### Features

- *(*)* Colorized irb prompt

## 2020-12-15

### Other

- Merge pull request #855 from daxgames/master

automate the vim plugin install so no prompt is displayed

## 2020-11-25

### Other

- Automate plugin install of vim s no prompt is displayed

## 2020-12-15

### Other

- Merge pull request #857 from nandalopes/ascii

Fix YADR success message

## 2020-12-13

### Other

- Use single quote string

`%q{}` notation
- Use single quote strings

## 2020-11-16

### Other

- Merge pull request #852 from nandalopes/fix-tmux-error

Fix C- tmux error
- Fix C- tmux error

`.tmux.conf:33: unknown key: C- if-shell`
- Merge pull request #850 from nandalopes/fix-845

Fix #845 Vim suspends in some times

## 2020-11-08

### Other

- Fix #845 Vim suspends in some times

## 2020-11-16

### Other

- Merge pull request #848 from vovinacci/fix/brew-install

fix: Update Homebrew install method

## 2020-11-13

### Other

- Revert setting +x

## 2020-11-07

### Other

- Update Homebrew install method

## 2020-11-13

### Other

- Merge pull request #849 from Zaryob/pr

added contributors alias into git.

## 2020-11-07

### Other

- Added contributors alias into git.

## 2020-06-22

### Other

- Merge pull request #839 from vovinacci/update-git-snapshot-dead-link

Update git dead link
- Update dead link

## 2020-03-15

### Other

- Merge pull request #834 from chrischen/update-vundle

Update vundle repos.
- Update vundle repos.

Update scrooloose repos as they seem to have changed maintainers.

## 2020-03-14

### Other

- Add github action for stale issues
- Merge pull request #825 from alanyee/master

Update vimrc

## 2019-07-21

### Other

- Update vimrc

Disable modelines as a security precaution

## 2019-08-17

### Other

- Merge pull request #827 from vovinacci/fix-macvim-install

Fix MacVim installation

## 2019-08-13

### Other

- Fix MacVim installation

## 2019-07-13

### Other

- Merge pull request #820 from ppries/2.9-compatibility

Translate tmux -fg, -bg and -attr options into -style options

## 2019-05-03

### Other

- Translate -fg, -bg and -attr options into -style options

## 2019-07-12

### Other

- Merge pull request #824 from Jason-Cooke/patch-1

docs: fix typo

## 2019-07-10

### Documentation

- Fix typo

## 2019-02-10

### Other

- Fix typo in README
- Merge pull request #815 from richashworth/patch-1

Update README.md
- Update README.md

Fixed typo in README

## 2019-02-05

### Other

- Merge pull request #813 from vovinacci/remove_brew_prune

zsh: Remove deprecated 'brew prune' command from alias

## 2019-02-04

### Other

- Remove deprecated 'brew prune' command

## 2019-01-15

### Bug Fixes

- Fix missing if detecting buffer fugitive type

### Other

- Merge pull request #812 from pablobender/fix-vim-fugitive

fix missing if detecting fugitive buffer type
- Merge pull request #811 from abohne/fugitive_type_fix

Replace call to deprecated fugitive function

## 2019-01-14

### Other

- Replace call to deprecated function

## 2018-05-27

### Other

- Merge pull request #796 from fizz/patch-1

Update prompt_skwp_setup

## 2018-05-15

### Other

- Update prompt_skwp_setup

## 2018-03-20

### Other

- Merge pull request #789 from erickwilder/fix-macvim-install-warning

fix(Rakefile) Remove --custom-icons flag to install macvim.

## 2018-03-19

### Bug Fixes

- Fix(Rakefile) Remove --custom-icons flag to install macvim.

## 2018-03-17

### Other

- Merge pull request #787 from gonzedge/replace-seil-with-karabiner-elements

Replace Seil with Karabiner-Elements
- Replace Seil with Karabiner-Elements

- Seil is deprecated as seen in https://pqrs.org/osx/karabiner/seil.html
- Karabiner-Elements is the new Seil as seen in https://pqrs.org/osx/karabiner/index.html
- Merge pull request #788 from gonzedge/update-full-screen-language

Update full screen language for iTerm/MacVim
- Update full screen language for iTerm/MacVim

## 2018-02-07

### Other

- Merge pull request #782 from nikolai-b/patch-1

Update ,K in docs

## 2018-02-05

### Other

- Update ,K in docs

https://github.com/skwp/dotfiles/commit/78da69d421ba3af8f835fdb6aa6c0076154472a2

## 2017-09-21

### Other

- Merge pull request #766 from padi/patch-1

KeyRepeat on Sierra way too fast to be practical
- Adjusts KeyRepeat & InitialKeyRepeat to be usable on macOS Sierra

Looks like they've changed the scale in macOS Sierrra. `KeyRepeat -int 0` seems to be too impractical. I can't even hold backspace because it erases too much. Since you've taken this from another repo, it's worth referencing the same issue in that repo:

mathiasbynens/dotfiles#687

## 2017-09-06

### Other

- Merge pull request #770 from alanyee/master

Update and rename osx to macos
- Update .dockerignore

Rename .osx to .macos

## 2017-09-05

### Other

- Update README.md

Further update from osx to macos
- Update and rename osx_tools.md to macos_tools.md
- Update and rename osx to macos

## 2017-09-01

### Other

- Merge pull request #768 from jon-choi/master

remove extra quotes

## 2017-08-23

### Other

- Remove extra quotes

## 2017-09-01

### Other

- Merge pull request #769 from alanyee/master

Update README.md
- Update README.md

-Made explicit HTTPS calls
-Replace OS X with macOS

## 2017-07-14

### Other

- Merge pull request #763 from jameszaghini/fix/install-hub-twice

Fix: hub packaged listed for install twice
- Hub packaged listed for install twice

## 2017-07-03

### Other

- Merge pull request #757 from skwp/path-duplicates

Prevent duplicate entries in $PATH. Fixes #690

## 2017-06-06

### Other

- Run $PATH dedup command everytime

## 2017-06-05

### Other

- Prevent duplicate entries in $PATH. Fixes #690

## 2017-06-20

### Other

- Merge pull request #760 from skwp/docker

Adding Docker support!
- [Credits] Add docker support

## 2017-06-06

### Other

- [Docker] Update README with Docker support
- [Docker] Add initial docker files
- [Install] Prevent empty SHELL failing installation

When running yadr via docker, $SHELL starts out empty/null, so that was
triggering a fatal method not found error during installation.
- Fix persistent undo (#758). Fixes #659

* Fix persistent undo

* fixed persistent undo

## 2017-06-05

### Other

- Merge pull request #756 from skwp/yp/remove-node-path

Remove node path setting which may interfere with RVM. People can set this themselves if node devs
- Remove node path setting which may interfere with RVM. People can set this themselves if node devs
- Merge pull request #754 from giorni/tmux-mouse

Enable mouse support for tmux 2.1+

## 2017-05-30

### Other

- Properly enable mouse support for tmux 2.1+
- Merge pull request #755 from skwp/revert-738-feature/ripgrep

Revert "Migrate from the silver searcher to ripgrep"
- Revert "Migrate from the silver searcher to ripgrep"
- Merge pull request #738 from stevenbarragan/feature/ripgrep

Migrate from the silver searcher to ripgrep

## 2017-05-23

### Other

- Fallback to ag if rg is not present

## 2017-02-23

### Other

- Merge branch 'master' into feature/ripgrep

## 2017-01-03

### Other

- Setup RipGrep for:grep

## 2016-12-31

### Other

- Migrate from the silver searcher to ripgrep

## 2017-05-23

### Other

- Merge pull request #728 from KristerV/patch-1

Update README.md
- Update README.md

## 2016-09-22

### Other

- Update README.md

## 2017-05-23

### Other

- Merge pull request #737 from casaper/brewu

fix: removed obsolete --all flag from brew upgrade

## 2016-12-30

### Bug Fixes

- Removed obsolete --all flag from brew upgrade

## 2017-05-23

### Other

- Merge pull request #734 from randaalex/patch-4

Enable scroll shell output with mouse in tmux

## 2016-11-18

### Other

- Enable scroll shell output with mouse in tmux

## 2017-05-23

### Other

- Merge pull request #750 from stevenbarragan/feature/tmux-tab-folder-name

Display forder name on tmux's window status

## 2017-04-12

### Other

- Display forder name on tmux's window's tab

## 2017-01-16

### Other

- Merge pull request #743 from skwp/yp/change-search-mapping

Remap K to ,k for search so you don't accidentally lock up vim
- Remap K to ,k for search so you don't accidentally lock up vim

People were complaining that "K" was too easy to hit by accident on a random char and search a large codebase.

## 2017-01-04

### Other

- Add graphql/jsx/fzf

## 2016-11-29

### Other

- Merge pull request #725 from lfilho/patch-2

Switch to henrik/vim-indexed-search

## 2016-09-13

### Other

- Switch to henrik/vim-indexed-search

## 2016-11-29

### Other

- Merge pull request #726 from lfilho/patch-3

Make .vundle files behave like vim files

## 2016-09-13

### Other

- Make .vundle files behave like vim files

## 2016-11-29

### Other

- Merge pull request #721 from prouty/patch-1

Fix unclosed parenthesis; make phrasing clearer.

## 2016-08-30

### Other

- Fix unclosed parenthesis; make phrasing clearer.

## 2016-11-29

### Other

- Merge pull request #729 from lfilho/patch-4

Remove duplicated mxw/vim-jsx plugin

## 2016-09-23

### Other

- Remove duplicated mxw/vim-jsx plugin

## 2016-11-08

### Other

- Better ctrlp matching algorithm

## 2016-10-07

### Other

- ,jj to get to javascript files

## 2016-08-24

### Other

- Add zzz alias for restarting zeus
- Merge pull request #718 from lfilho/patch-1

Change argtextobj to wellle/targets.vim

## 2016-07-25

### Other

- Change argtextobj to wellle/targets.vim

## 2016-08-24

### Other

- Merge pull request #720 from Slotos/revert-fix-that-broke-what-was-not-broken

Revert ef2156144f726ef8328e7dc299cf8e0b6b459127

## 2016-08-19

### Other

- Revert ef2156144f726ef8328e7dc299cf8e0b6b459127

In case of new-window and split-window
-F is not a replacement to -c, it is an absolutely different beast
-F formats -P output
-c sets a working directory

This reverts a fix that broke what was not broken.

## 2016-07-23

### Other

- Remove dead alias
- Merge pull request #682 from blackxored/patch-1

Use new syntax for smart pane navigation

## 2016-01-01

### Other

- Use new syntax for smart pane navigation

As recommended in original source. As opposed to failing with a message that the command returned 1 and losing access to everything on this screen, this will warn on the status bar if only one pane is present.

## 2016-07-23

### Other

- Merge pull request #713 from randaalex/patch-3

Add .tags and .tags1 to gitignore template

## 2016-07-05

### Other

- Add .tags and .tags1 to gitignore template

atom-ctags plugin generate .tags and .tags1

## 2016-07-23

### Other

- Merge pull request #716 from yonilerner/patch-1

Minor README formatting change

## 2016-07-22

### Other

- Minor README formatting change

## 2016-07-23

### Other

- Merge pull request #715 from suchov/patch-1

remove bitdeli.com broken image

## 2016-07-19

### Other

- Remove bitdeli.com broken image

https://bitdeli.com/ - looks like they down, I don't know if it's just a long downtime, but looks like they are not supporting the site anymore.

## 2016-07-23

### Other

- Merge pull request #677 from mjbamford/fix_tmux_key_bindings

Fix iTerm key bindings broken in tmux 2.1

## 2015-11-10

### Other

- Set tmux assume-paste-time to 0

## 2016-07-23

### Other

- Merge pull request #656 from andreazevedo/patch-2

Fix tmux.conf

## 2015-08-24

### Other

- Fix tmux.conf

Fix tmux "open new pane in current path" option.

## 2016-07-23

### Other

- Merge pull request #707 from sonnius/master

Added higlight to zoomed window

## 2016-05-01

### Other

- Added higlight to zommed window

## 2016-07-22

### Other

- Add node modules bin into default path
- Default to eslint

## 2016-06-15

### Other

- Merge pull request #711 from padi/patch-1

Add vim shortcut: copy the relative path of a file

## 2016-06-07

### Other

- Add vim shortcut: copy the relative path of a file

I've been using ,cf for some of the time, but sometimes I don't want the full path for a variety of reasons:
- any command where relative path suffices (running tests, removing files)
- the full path won't work if I'm using MacVim and the project is within vagrant cli

## 2016-05-24

### Other

- Update README.md

## 2016-05-12

### Other

- Remove grep current partial, doesn't work well

## 2016-04-28

### Other

- Revert "Merge pull request #701 from yjlintw/upstream"

This reverts commit e84ba17c26195b96035b931a12f27a2f6b33b630, reversing
changes made to 1edab81c26e57a08b35ffc88108e09b6844e7dcd.
- Merge pull request #701 from yjlintw/upstream

Fixed GUI visual mode highlight color

## 2016-03-29

### Other

- Fixed GUI visual mode highlight color

## 2016-04-28

### Other

- Opens nerdtree to the root of your current project if not looking at a file
- Merge pull request #699 from lfilho/editorconfig

Add: Vim plugin: editorconfig

## 2016-03-28

### Other

- Vim plugin: editor config

## 2016-04-28

### Other

- Fix system override of vim install [Fix #686]
- Update prezto
- Merge pull request #692 from androidStern/find_or_create_zshrc_content

Don't append already existing content to .zshrc on rake update

## 2016-02-17

### Other

- Don't append already existing content to .zshrc on rake update

## 2016-04-28

### Other

- Merge pull request #688 from jasonwbarnett/update-prezto-to-latest

update prezto to latest

## 2016-02-01

### Other

- Updated prezto to latest

## 2016-04-28

### Other

- Merge pull request #700 from lfilho/clean-old-refs-up

Remove old references to plugins

## 2016-03-28

### Other

- TagBar and Conque orphan references

## 2016-04-28

### Other

- Merge pull request #703 from lfilho/ghi-hub

Install ghi and hub via brew

## 2016-03-30

### Other

- Install ghi and hub via brew

## 2016-04-28

### Other

- Merge pull request #705 from lfilho/new-git-zsh-aliases

Add more git fetch aliases

## 2016-04-07

### Other

- Add more git fetch aliases

(cherry picked from commit dbbf3024a8af023178590be17ddf4ba6dc492918)

## 2016-04-14

### Other

- Update README.md

## 2016-02-11

### Other

- Set shell so that path to ctags is correct

## 2016-01-29

### Other

- Treat ES6 extension files as javascript

## 2016-01-20

### Other

- Add jsx bundle

## 2015-11-01

### Other

- Remove zr alias conflicting with zeus rspec

## 2015-10-27

### Other

- Fix zeus alias
- Run tests using zeus with zl and zs
- Add zeus aliases

## 2015-10-21

### Other

- Merge pull request #653 from merty/patch-1

Fixed a typo

## 2015-08-22

### Other

- Fixed a typo

## 2015-10-21

### Other

- Merge pull request #664 from stevenbarragan/feature/delete-merged-branches

Add command to delete all already merged branches

## 2015-09-23

### Other

- Add command to delete already merged branches

## 2015-10-21

### Other

- Merge pull request #666 from chrisbutcher/patch-1

Fix typo: "postres" -> "postgres"

## 2015-10-01

### Other

- Fix typo: "postres" -> "postgres"

## 2015-09-08

### Other

- Ctrl-x and Ctrl-z navigate the quickfix list

## 2015-09-07

### Other

- Update ctrlp [Fix #645]

## 2015-08-13

### Other

- Allow ts alias to use a specific VM_IP

## 2015-08-12

### Other

- More secure alias for starting thin client on localhost only

## 2015-07-30

### Other

- Merge pull request #643 from ldong/master

Updated vimrc

## 2015-07-27

### Other

- Updated vimrc

Changed to create `~/.vim/backups` directory for `persistent_undo` only once.
- Unmap gf..causing issues
- Update prezto to point to master
- Unmap ctrl-f which overrides normal vim behavior
- Install prezto via symlink [Fix #624]
- Merge pull request #591 from nikolai-b/master

install AND update vundles on rake update

## 2015-01-07

### Other

- Install AND update vundles on rake update

## 2015-07-27

### Other

- Merge pull request #616 from ethanmad/origin/brewu-patch

Update `brewu` alias to use `upgrade --all` for future proofing

## 2015-05-05

### Other

- Made --all a flag for `brew upgrade`

& Removed flag from `brew update`

## 2015-04-29

### Other

- Update 'brewu' alias to use 'update --all' for future proofing

## 2015-07-27

### Other

- Merge pull request #623 from dcrec1/master

add a description to the update Rake task

## 2015-06-14

### Other

- Add a description to the update Rake task

adding a description makes the task being listed when running `rake -T`

## 2015-07-27

### Other

- Merge pull request #618 from ndelage/patch-1

Add note about vim+lua+neocomplete+rvm segfault

## 2015-05-04

### Other

- Add note about vim+lua+neocomplete+rvm segfault

## 2015-07-27

### Other

- Add css/sass/less for ctags
- Merge pull request #606 from MosheZada/global-zsh-reload

Handle SIGHUP by reloading zshrc

## 2015-02-27

### Other

- Handle SIGHUP by reloading zshrc

## 2015-07-27

### Other

- Rename poorly named method in rakefile
- Merge pull request #595 from blittle/master

Change the NERDTreeFind keymap to not statically set the nerdtree window size

## 2015-01-13

### Other

- Change the NERDTreeFind keymap to not statically set the nerdtree window size

With this change users can now change the variable g:NERDTreeWinSize and have it applied
to new instances of NERDTree created with the NERDTreeFind keymap ctrl-\

## 2015-07-22

### Other

- Merge pull request #608 from mul14/master

Make installation more faster

## 2015-03-13

### Other

- Make installation more faster

Clone only the latest history

## 2015-07-22

### Other

- Merge pull request #604 from gitter-badger/gitter-badge

Add a Gitter chat badge to README.md

## 2015-02-16

### Other

- Added Gitter badge

## 2015-07-22

### Other

- Merge pull request #598 from DNNX/patch-1

Fix a typo in README

## 2015-01-22

### Other

- Rename PCKeyboardHack to Seil

And change the link accordingly.
- Fix a typo in README

## 2015-07-22

### Other

- Merge pull request #637 from katgironpe/master

Use correct RSpec.vim repo

## 2015-07-05

### Other

- Use correct RSpec.vim repo

## 2015-07-22

### Other

- Merge pull request #633 from alex-wood/keymapping-enhancements

Additional aliases

## 2015-06-27

### Other

- Make numpad enter work
- + misc helpful key mappings

## 2015-07-22

### Other

- Merge pull request #639 from victormours/auto-indent-pasted-text

Auto indent pasted text in vim

## 2015-07-17

### Other

- Auto indent pasted text in vim

'=' is to indent, '`]' is to do it until the end of the pasted text,
and '<C-o>' brings the cursor back to the start of the pasted text.

## 2015-06-23

### Other

- Fix shortcuts for deprecated Rails.vim commands

## 2015-06-03

### Other

- Change Cmd-Space to Ctrl-Space for autocomplete

## 2015-04-14

### Other

- This wasn't working and occasionally introduced problems in other areas

## 2015-03-24

### Other

- Make syntastic play nice with RVM

## 2015-01-08

### Other

- Merge pull request #593 from dsimmons/search-settings

[Improvement] Search Settings
- Moved .vimrc-level settings (pertaining to search) out of ./vim/settings/yadr-search.vim and into ./vimrc. Also removed unnecessary+problematic viminfo setting.

## 2015-01-06

### Other

- Revert bundle syntax update that may have caused pain for upgraders [Fix #588]

## 2015-01-05

### Other

- Merge pull request #587 from mlazarov/master

Updating github raw userdata urls to githubusercontent.com
- Updating github raw userdata urls to githubusercontent.com

## 2015-01-04

### Other

- Switch out individual language packs for vim-polyglot [Fix #573]
- Vundle syntax update [Fix #578]
- Readme cleanup
- Add csapprox for gblame to work in terminal [Fix #579]
- Removed deprecated tagbar usage
- Merge pull request #577 from nikolai-b/master

fix error in linux font install

## 2014-12-17

### Bug Fixes

- Fix error in linux font install

## 2015-01-04

### Other

- Merge pull request #581 from gerrywastaken/patch-1

Make Easymotion keys visible

## 2014-12-23

### Other

- Make Easymotion keys visible

The current readme uses tag delimiters which results in part of the readme being hidden from the end user. It is also not obvious that the commas are keys and not just a break in the sentence. For this and other reasons I also wrapped all keys in the kdb tags were are specifically intended for this situation.

## 2015-01-04

### Other

- Merge pull request #583 from dsimmons/refactor/dedupe-persistent-undo

Remove redundant persistent-undo.vim

## 2014-12-30

### Other

- Removed redundant persistent-undo.vim

## 2015-01-04

### Other

- Merge pull request #584 from timstott/remove_duplicate_splits_mappings

Remove duplicate window split mappings

## 2014-12-31

### Other

- Remove duplicate window split mappings

## 2015-01-04

### Other

- Merge pull request #585 from skwp/prezto-update

Update prezto
- Update prezto; testing for a clean install
- Example of setting colorscheme in README
- Removed reference to janus
- Add base16 colorscheme as an option

## 2014-12-27

### Other

- Merge pull request #582 from timstott/remove_stale_plugin_settings

Remove orphan vim settings for LustyExplorer plugin
- Remove orphan vim settings for LustyExplorer plugin

## 2014-12-01

### Other

- Merge pull request #575 from jby/fix_tmux_conf_syntax

Fixed tmux.conf syntax after PR #565
- Fixed tmux.conf syntax

## 2014-11-21

### Other

- Fix solarized easymotion in terminal vim
- Merge pull request #562 from jby/new_lightline_settings

Modified setings of lightline to match the README in the lightline project

## 2014-11-11

### Other

- Modified setings of lightline to match the README in the lightline project Added indication of paste mode, added functions instead of code in call of components, added git branch glyph, added path to file being edited

## 2014-11-21

### Other

- Merge pull request #570 from lfilho/fix-macvim-external-display

Adding script to fix MacVim bug with external displays

## 2014-11-20

### Other

- Adding shell script to fix MacVim bug with external displays

(cherry picked from commit 479a0b5b714805218fa16ed91446d19bbebffcfd)

## 2014-11-21

### Other

- Merge pull request #571 from lfilho/move-osx-bin

Moving ./osx to ./bin/osx

## 2014-11-20

### Other

- Moving ./osx to ./bin/osx

## 2014-11-19

### Other

- Merge pull request #564 from timstott/update_documentation

Update vim enhancements README with Lightline

## 2014-11-11

### Other

- Update vim enhancements README with Lightline

## 2014-11-19

### Other

- Merge pull request #565 from ianks/tmux-split

Make tmux split exactly 50%

## 2014-11-12

### Other

- Make tmux split exactly 50%

## 2014-11-19

### Other

- Merge pull request #569 from adamenger/patch-1

Add :q to exit shell
- Update aliases.zsh

Adding :q to exit your shell

## 2014-10-29

### Other

- Merge pull request #556 from stevenbarragan/update-multicursor-plugin

Point vim-multiple-cursors to current owner
- Point vim-multiple-cursors to current owner

## 2014-10-25

### Other

- Merge pull request #551 from dsimmons/fix/nerdtree-keybinding

[Fix] Keybinding conflict introduced as part of #526.

## 2014-10-24

### Other

- Fixed keybinding conflict introduced as part of #526.
- Merge pull request #549 from ianks/master

Remove vim/.vundles.local.bak from source control
- Remove vim/.vundles.local.bak from source control
- Navigate seamlessly between vim and tmux [Fix #526]
- Merge pull request #510 from nikolai-b/master

separate mac and linux vim keymaping

## 2014-09-29

### Other

- Make more mappings use Alt + readme
- Use alt for more mappings

## 2014-07-17

### Other

- Add linux font install

## 2014-07-16

### Other

- Separate mac and linux vim keymaping

## 2014-10-24

### Other

- Merge pull request #546 from jeffwidman/patch-2

Remove deprecations from gemrc

## 2014-10-17

### Other

- Remove deprecations from gemrc

Removed deprecated bulk_threshold-instance method:
http://www.rubydoc.info/github/rubygems/rubygems/Gem/ConfigFile#bulk_threshold-instance_method

--no-ri --no-rdoc is deprecated, use --no-document
Reference: http://guides.rubygems.org/command-reference/

## 2014-10-24

### Other

- Merge pull request #547 from tmullen/update_homebrew_path

Update to Homebrew app install path.

## 2014-10-18

### Other

- Update to Homebrew app install path.

## 2014-10-24

### Other

- Status bar shows even on one pane [Fix #538]
- Merge pull request #545 from jeffwidman/patch-1

Update gitignore vim settings

## 2014-10-17

### Other

- Update gitignore vim settings

Pulling in updates from Github's global vim gitignore file:  https://github.com/github/gitignore/blob/master/Global/vim.gitignore

## 2014-10-24

### Other

- Merge pull request #511 from nikolai-b/git-config-fix

remove outdated git option

## 2014-07-17

### Other

- Remove outdated git option

## 2014-10-24

### Other

- Merge pull request #548 from ianks/master

Make ls/ll aliases linux friendly
- Make ls/ll aliases linux friendly

## 2014-10-21

### Other

- Update themes.md

## 2014-10-08

### Other

- Gpsh now automatically sets up tracking for the current branch name

## 2014-09-30

### Other

- Increase number of recent branches

## 2014-09-28

### Other

- Merge pull request #532 from ianks/solarized-choice

Allow user to not use solarized

## 2014-09-22

### Other

- Allow user to not use solarized

## 2014-09-28

### Other

- Merge pull request #533 from lfilho/patch-1

Ignoring just "tags" is too generic

## 2014-09-23

### Other

- Ignoring just "tags" is too generic

My application had a folder named "tags" as part of its business rules and because of this it got ignored.
I believe upadting this section according to the very link in the comment above should fix it. (not ignoring `tags/` folder).

## 2014-09-28

### Other

- Merge pull request #536 from ianks/update-prezto

Update zprezto
- Update zprezto
- Merge pull request #535 from ianks/master

New windows from current pane path, easy reloading of Tmux

## 2014-09-24

### Other

- Merge https://github.com/skwp/dotfiles

* https://github.com/skwp/dotfiles:
  Add aliases ('cls' and 'brewU')
  Make tmux pane resizing more natural

## 2014-09-22

### Other

- Merge pull request #531 from ianks/master

Add aliases ('cls' and 'brewU')
- Add aliases ('cls' and 'brewU')

## 2014-09-05

### Other

- Merge pull request #528 from ianks/resize-panes

Make tmux pane resizing more natural

## 2014-08-25

### Other

- Make tmux pane resizing more natural

## 2014-09-24

### Other

- Start tmux window in /Users/ianks/.yadr

## 2014-09-02

### Other

- Merge pull request #529 from gringocl/fix-indentation

Fix indentation

## 2014-08-27

### Other

- Fix indentation

## 2014-08-19

### Other

- Merge pull request #525 from gonzedge/spring-rails-console-alias

Add `src` alias for `spring rails c`

## 2014-08-16

### Other

- Add src alias for 'spring rails c'.

## 2014-08-19

### Other

- Merge pull request #527 from storypixel/patch-1

Update vimrc
- Update vimrc

## 2014-08-15

### Other

- Better colors

## 2014-08-07

### Other

- Aliases for rails db migrations
- Remove jasmine.vim which was conflicting with javascript-libraries-syntax.vim
- \sp for specify {} blocks

## 2014-07-21

### Other

- Get rid of heavy omni complete - seems to hang on some machines

## 2014-07-04

### Other

- Merge pull request #506 from padi/patch-1

0_path.zsh reinserts .yadr directories twice in $PATH when in tmux

## 2014-06-19

### Other

- 0_path.zsh reinserts .yadr paths twice in tmux

in terminal
```sh
sky@nimbus ~ $ echo $PATH 
/Users/sky/.rbenv/shims:/Users/sky/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/sky/.yadr/bin:/Users/sky/.yadr/bin/yadr
```

in tmux

```sh
sky@nimbus ~ $ echo $PATH
/Users/sky/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/sky/.rbenv/shims:/Users/sky/.yadr/bin:/Users/sky/.yadr/bin/yadr:/Users/sky/.yadr/bin:/Users/sky/.yadr/bin/yadr
```

## 2014-07-04

### Other

- Merge pull request #497 from Sumukh/master

Added the Agnoster prompt as an option.
- Add the agnoster prompt, with customizations

## 2014-07-03

### Other

- Explain how to deal with unsolarized terminals in docs
- If you don't use a solarized terminal, you have to set g:yadr_using_unsolarized_terminal now [Ref #487]

## 2014-06-24

### Other

- Update docs
- Ability to disable solarized enhancements [Fix #487]
- Merge pull request #504 from razum2um/fix_dark_mode_iterm_vim

fix colors in console vim on iterm2

## 2014-06-13

### Bug Fixes

- Fix dark mode in vim+iterm2

## 2014-06-19

### Other

- Git recent branches alias

## 2014-06-17

### Other

- Don't override ctrl-b for buffer search. we have ,b [Fix #484]
- Add hpr hub pull-request alias
- Switch to lokaltog easymotion instead of skwp fork [Fix #447]

## 2014-06-11

### Other

- Merge pull request #496 from Vijar/master

zsh aliases to show/hide hidden files in Finder

## 2014-05-30

### Other

- Zsh aliases to show/hide hidden files in Finder

## 2014-06-11

### Other

- Merge pull request #502 from keikun17/master

[fixes #501] Fix ag string typo。
- [fixes #501] Fix ag string typo。
- Merge pull request #503 from rkowalewski/master

Fix in vim settings
- [FIX] fixed an error in vim settings

## 2014-06-10

### Other

- Merge pull request #498 from blackxored/ctrlp-unlet

Unset ctrlp_user_command prior to redefinition.

## 2014-06-04

### Other

- Unset ctrlp_user_command prior to redefinition

## 2014-06-10

### Other

- Merge pull request #499 from giorni/iterm-plist

Fix for iTerm themes install on Mavericks
- Fix for iTerm themes install on Mavericks

Mavericks cache preferences and overwrites defaults from cache, not
installing it properly. Reading it after install updates the cache with
new values.

## 2014-05-29

### Other

- Merge pull request #485 from maletor/neocomplete_settings

neocomplete: update settings

## 2014-05-13

### Other

- Update settings

## 2014-05-02

### Other

- Remove tagbar settings [Fix #464]

## 2014-04-30

### Other

- Merge pull request #474 from lfilho/patch-1

Fix Ag functions

## 2014-04-29

### Other

- Fix Ag functions

I believe this is what is intended? It was not working for me like it was...

## 2014-04-28

### Other

- Remove duplicated plugin
- Decided disabling arrow keys was hurting new people too much
- Merge pull request #470 from martco/patch-1

Update vim-improvements.vundle
- Update vim-improvements.vundle

This removes a redundant Bundle that already appears on line 9. This was throwing warnings for me whenever I started macvim.

## 2014-04-10

### Other

- Merge pull request #465 from vdmgolub/snipmate_docs_update

Snipmate docs update
- Snipmate's version notice removed

Another snipmate's fork (garbas/vim-snipmate) is used now. The notice is
obsolete now.
- Snipmate description updated

Scrooloose snippets were replaced with honza/vim-snippets.

## 2014-04-01

### Other

- Merge pull request #463 from alex-frost/master

change string comparison
- Change string comparison

## 2014-03-29

### Other

- Merge pull request #462 from fayimora/patch-4

Return git branches to lightline statusbar

## 2014-03-28

### Other

- Add fugitive to lightline statusbar

## 2014-03-14

### Other

- Improve easymotion highlighting to be yellow not an ugly red block
- Always install zshrc; prevents problems if prezto dir exists but zshrc is missing [Fix #452]
- Update README.md

## 2014-03-07

### Other

- Update README.md
- Merge pull request #455 from Vijar/master

Fixed wrong setup for easyvim
- Fixed wrong setup for easyvim

## 2014-03-02

### Other

- Don't mess with bundler if it's not available

## 2014-02-16

### Other

- Removed tagbar; not using
- Remove mvim binary; ships with homebrew's macvim [Fix #450]
- Add Bitdeli badge
- Split vundles into multiple files to reduce churn
- Merge pull request #446 from paulnsorensen/add-bundle-config

Add bundle parallel config

## 2014-02-03

### Other

- Remove verbosity in core calculation
- Add bundle parallel config

## 2014-02-16

### Other

- More readme cleanup
- Readme cleanup
- Remove vinegar; Didn't like the dash usage.
- Rename git changelog => git simple to avoid conflict with git-extras
- Replace GitGrep with Ag

## 2014-02-01

### Other

- Hit Space and type two letters to quickly jump somewhere
- Removed mapping; doesn't exactly work. You can still use Ctrl-R when in :ex mode
- Added Ctrl-R, reverse history search for :commands

## 2014-01-28

### Other

- Fix docs

## 2014-01-25

### Other

- Make 0 go to first character, making it easier to work with indented languages
- Remove ;; semicolon mapping. Messes with regular semicolon usage (find next char)

## 2014-01-20

### Other

- Fix up settings for neocomplete
- Merge pull request #424 from maletor/neocomplete

Initial crack at neocomplete

## 2013-12-19

### Other

- Replace with neocomplete
- Initial crack at neocomplete

## 2014-01-20

### Other

- Merge pull request #439 from tku90/zprezto-key-binding-fix

fixed zpreztorc key-bindings

## 2014-01-15

### Bug Fixes

- Fixed zpreztorc key-bindings

## 2014-01-06

### Other

- Change to Lightline instead of Airline [Fix #418]

## 2014-01-05

### Other

- Added support for js highlighting for jquery/other frameworks
- Merge pull request #421 from irrationalfab/investigate.vim

Any interest in investigate.vim?

## 2013-12-17

### Other

- Add investigate.vim

## 2014-01-05

### Other

- Merge pull request #436 from grossjonas/master

Fix syntastic deprecation
- Fix syntastic deprecation

## 2014-01-01

### Other

- Merge pull request #428 from lfilho/patch-1

Make gf create the file if not existent

## 2013-12-21

### Other

- Removing outdated comment
- Make gf create the file if not existent

## 2014-01-01

### Other

- Merge pull request #425 from sagmor/fix-homebrew-install

Update Homebrew install script

## 2013-12-19

### Other

- Update Homebrew install script

## 2013-12-30

### Other

- Merge pull request #432 from bobek/guifont-gtk

Load correct fonts under GTK
- Load correct fonts under GTK
- Go back to using neocomplcache; prematurely upgraded
- Install good version of MacVim with lua support

## 2013-12-28

### Other

- Reorg bundles, add vim-vinegar and vim-grubox alternate colorscheme

## 2013-12-19

### Other

- Merge pull request #426 from sagmor/add-zsh-to-standard-shells

Add zsh to standard shell list
- Add zsh to standard shell list

`/usr/local/bin/zsh` has to be at `/private/etc/shells` in order to `chsh` to it

## 2013-12-18

### Other

- Merge pull request #423 from maletor/patch-5

Use environment shell
- Use environment shell fixes #422
- Updated the changelog - about time
- CtrlP no longer jumps you to the file if it's already open.

This makes it easier to maintain multiple Tab workspaces involving the
same files. For example, in one workspace you want a class and its spec,
and in another tab you want to see that class in context with another
collaborator. This allows you to open the window multiple times.

## 2013-12-16

### Other

- Fall back to /bin/zsh if /usr/local/bin/zsh doesn't exist
- Fix path to zsh to use the homebrew installed newer version
- Merge pull request #419 from maletor/patch-3

Safely add reattach-to-user-namespace
- Safely add reattach-to-user-namespace
- ,ag and ,af for invoking :Ag and :AgFile
- Let's be opinionated - disable the arrow keys and save the world
- Aliases for spring/rails
- Change multicursor to use ,mc instead of Ctrl-m which was screwing up other behavior
- Readme cleanup, and NrrwRgn plugin that was lost
- More marketing fluff :)
- Added ,rs ,rl ,ss ,sl commands for running specs in iTerm
- Readme updates
- Removed conque settings, no longer used

## 2013-12-15

### Other

- Fixed multicursor mapping to Ctrl-m so that it actually works
- Don't try to clone vundle if we already have it [Fix #415]
- Update README.md
- Fallback to using git ls-files if ag is missing
- Merge pull request #413 from treppo/ctrlp-ag

Use ag as ctrlp's search command

## 2013-12-08

### Other

- Use ag as ctrlp's search command

## 2013-12-15

### Other

- Swap specky for lighter weight rspec.vim for highlighting
- Removed vim-ruby-conque, causes shell connection leaks and other issues
- Clean up tmux conf
- Splitting up docs
- Removed unused submodule

## 2013-12-14

### Other

- Readme cleanups
- Merge pull request #416 from fayimora/patch-3

Update README.md
- Update README.md

## 2013-12-11

### Other

- Merge pull request #412 from treppo/solarized-vim

Remove setting 256 colors for solarized on terminal vim
- Remove setting 256 colors for solarized on terminal vim

## 2013-12-05

### Other

- Readme cleanup

## 2013-12-02

### Other

- Merge pull request #409 from c0nspiracy/fix-coderay-customization

Fix token color customization for CodeRay >= 1.1.0

## 2013-11-29

### Other

- Compare version numbers properly
- Fix token color customization for CodeRay >= 1.1.0

See: https://github.com/rubychan/coderay/commit/e2acec3ef141725d2fc264e56d1aa18e838c6acf
     https://github.com/pry/pry/issues/1012#issuecomment-29213405

## 2013-12-02

### Other

- Revert "Merge pull request #410 from treppo/master"

This reverts commit 6e344fef4e00914d3a2e8955f48cf5ca7479a945, reversing
changes made to 4c88ca6e45dfb9b2bd80f1ff3eebd84e7b5d885d.

## 2013-11-29

### Other

- Merge pull request #410 from treppo/master

Remove setting 256 colors for solarized on terminal vim
- Remove setting 256 colors for solarized on terminal vim

## 2013-11-25

### Other

- Merge pull request #394 from treppo/master

Allow users to overwrite the tmux configuration

## 2013-11-15

### Other

- Allow local configuration for tmux
- Merge pull request #405 from jby/add_tmux_vim_syntax

Added syntax highlightning for tmux.conf

## 2013-11-13

### Other

- Added syntax highlightning for tmux.conf

## 2013-11-15

### Other

- Merge pull request #406 from jeremyclement/master

Resolve error "E518: Unknown option: undofile" for vim < 7.3
- Just a spelling mistake in comment
- Make :Gsesarch way faster - requires to :BundleUpdate to get latest skwp/greplace.vim
- Spring rspec alias

### Testing

- Test presence of persistent_undo module before use it. (prevent error msg for versions<703)

## 2013-11-05

### Other

- Merge pull request #402 from imobach/master

Enable tmux to send-prefix using C-a a

## 2013-10-29

### Other

- Enable tmux to send-prefix using C-a a

* It's useful when you have a tmux session into another tmux session
  (ie. via ssh).

## 2013-11-04

### Other

- Go back to using skwp prompt for rvm-prompt integration
- Changed reference to prezto master
- Fix gitconfig colors causing iTerm with solarized to show diffs incorrectly
- Add puppet module

## 2013-10-30

### Other

- Removed sparkup from readme [Fix #403]

## 2013-10-21

### Other

- Silence vim-session dialogs
- Move vim settings out of plugins to ensure they all get correctly loaded after everything else [Fix #373]
- Update README.md

## 2013-10-09

### Other

- Git recent-branches - tell me what i worked on recently

## 2013-09-18

### Other

- Git snapshot: take a snapshot and stash it without messing with your working tree

## 2013-09-03

### Other

- Merge pull request #387 from maletor/patch-2

Update ctrlp.vim

## 2013-08-29

### Other

- Update ctrlp.vim

## 2013-09-03

### Other

- Merge pull request #390 from jby/fix_vim-sparkup

Removed bundle kogakure/vim-sparkup.git
- Removed bundle kogakure/vim-sparkup.git since the repo doesn't exist on github anymore

## 2013-08-17

### Other

- Merge pull request #379 from kris-luminar/bugfix_cant_find_pane

fix can't find pane bug

## 2013-08-09

### Bug Fixes

- Fix can't find pane bug

## 2013-08-05

### Other

- Merge pull request #377 from phillipalexander/patch-1

Remove redundant recommended OSX tool 'autojump'  from README.md
- Remove redundant recommended OSX tool 'autojump' 

autojump 'j' functionality is matched/replaced by fasd 'z' command (installed and enabled as a prezto submodule by default). Instead of typing `j [dirspec]`, you simply type `z [dirspec]`.
- Don't use powerline fonts in airline [Fix #367] maybe

## 2013-08-04

### Other

- Added vim-session; :SaveSession and :OpenSession [Fix #322]
- Upgraded hub command
- Remove unused run_tags. Use :Rtags instead
- Kill sass-status [Fix #361]
- Added multicursor - hit Ctrl-n to select multiple things and then i/c them! [Fix #368]
- Switch to steeef_simplified prompt which doesn't seem to be problematic like the skwp prompt with newer prezto installs [Fix #272 #286]

## 2013-08-02

### Other

- Added simplified steeef theme without newlines

## 2013-08-01

### Other

- Merge pull request #364 from lfilho/yankring-Y-behaviour

Fixing Y behaviour

## 2013-06-16

### Other

- Fixing Y behaviour

## 2013-08-01

### Other

- Remove duplicate vundles (thanks fayimora)
- Merge pull request #375 from DanielWright/patch-1

Updates RubyGem sources
- Updates RubyGem sources

`gems.rubyforge.org` and `gems.github.com` have been replaced with `rubygems.org` as RubyGems sources
- Swapped out powerline for airline [Fix #372]

## 2013-07-16

### Other

- Merge pull request #369 from bridgeutopia/master

Remove duplicate of vim-slim on vundles

## 2013-07-13

### Other

- Remove duplicate of vim-slim on vundles

## 2013-06-21

### Other

- Remove lusty juggler / not using

## 2013-06-19

### Other

- Add :ChangeHashSyntax for ruby 1.8->1.9 hashes

## 2013-06-12

### Other

- Merge pull request #357 from nandalopes/fix-311-dirty-worktree

[Fix #311] zsh/presto gets "modified" after clean install

## 2013-06-06

### Other

- [Fix #311] zsh/presto gets "modified" after clean install

## 2013-06-12

### Other

- Merge pull request #359 from victormours/adding-brew-update

Adding brew update to Rakefile
- Follow presentation style
- Adding brew update

## 2013-06-04

### Other

- Revert "Fix: dirty worktree after running 'rake install'"

This reverts commit 50fdb9109f43ad8185b9cc2a36cc94db953d3b0c.

## 2013-06-03

### Other

- Highlight easymotion targets

## 2013-05-29

### Other

- Merge pull request #337 from treppo/master

Add multiple selection

## 2013-05-22

### Other

- Add the multicursor plugin

## 2013-05-29

### Other

- Merge pull request #344 from nandalopes/fix-dirty-worktree

Fix: dirty worktree after running 'rake install'
- Dirty worktree after running 'rake install'
- Merge pull request #343 from nandalopes/load-ssh-module

Fix: [Zsh] load ssh-agent module
- Update prezto

## 2013-05-27

### Other

- Merge pull request #342 from MarioRicalde/patch-3

Adds some missing links to the Readme
- Adds some missing links to the Readme

## 2013-05-21

### Other

- Merge pull request #336 from MarioRicalde/patch-2

Removes Swipe back/forth feature for Chrome

## 2013-05-20

### Other

- Removes Swipe back/forth feature for Chrome

Swiping on Chrome my accident is a pain when using the inspector, this command will disable it only for Google Chrome.

## 2013-05-16

### Other

- Fix previous commit

Added the wrong file by mistake
- Fix a bug with installing new vim plugin from the command line

Fixes #328

## 2013-05-14

### Other

- Revert "Wrapping search. Perl regex while searching. Center search matches and jumps"

This caused strange issues like inability to properly search for ruby
instance variables.

This reverts commit 88dd66685af2ba85970d5100bb5c1a3135213228.

## 2013-05-13

### Other

- Merge pull request #332 from lfilho/better-search-and-jump

Some more improvements to searching and jumping

## 2013-05-09

### Other

- Wrapping search. Perl regex while searching. Center search matches and jumps

## 2013-05-13

### Other

- Map ,t to CtrlP standard (not mixed) [Fix #333]
- Revert "Externalizing color scheme configs outside plugin folder" -
screwed up command line vim

This reverts commit 20d884b842e60b66bb35ecebcc9c3478707dbcf3.

## 2013-05-09

### Other

- Merge pull request #315 from lfilho/custom-themes

Custom themes / colorschemes

## 2013-04-30

### Other

- Externalizing color scheme configs outside plugin folder
(cherry picked from commit ac952b3d3ffbe8ea33460e98a37eb6ce67a871c1)

## 2013-05-09

### Other

- Merge pull request #331 from kuroir/patch-1

Disable Expose ( Mission Control ) Animations
- Disable Expose ( Mission Control ) Animations

They suck when using multiple displays, no need to have them.

## 2013-05-03

### Other

- Merge pull request #324 from lfilho/cleaning-vundle

Cleaning vundles.vim
- Cleaning vundles.vim

Conflicts:
	vim/vundles.vim

## 2013-05-02

### Other

- Removed gitgutter - causing slowness
- Merge pull request #320 from lfilho/organizing-vundles

Re-organizing vundle file
- Re-organizing entire file
- Merge pull request #317 from petRUShka/vim-ruby-debugger-fix

Fix: make vim command be os-specific, readme fix

## 2013-05-01

### Other

- Fix: make vim command be os-specific, readme fix
(cherry picked from commit c58e8d3c3cc923639241e2e5edc59846fb5ba810)

## 2013-05-02

### Other

- Merge pull request #319 from lfilho/next-textobject-update

Updating next-textobject to Steve Losh's new version
- Updating next-textobject to Steve Losh's new version
- Merge pull request #318 from lfilho/more-txt-obj-vundles

Adding 3 more and organizing text objects vundles
- Adding 3 more and organizing text objects vundles

## 2013-05-01

### Other

- Merge pull request #316 from nandalopes/sfix_readme

Small fix documentation for CtrlP vim plugin
- Fix documentation for CtrlP vim plugin

Ctrl-p shortcut is actually used by yankring plugin
(cherry picked from commit 26400827300686ad5f3d4daba0f1b841e12d474a)
- Revert "Change indent/unindent behaviour in visual mode"

This is not good for normal vim behavior. You should be able to hit '.'
to repeat the last command. This change breaks that with respect to
indenting.

This reverts commit 72ff8f33db0f6b3ec37f8012d1979184c1751ff8.

## 2013-04-30

### Other

- Merge pull request #292 from skwp/vundles_local

Add .vundles.local to allow per-installation plugin customization

## 2013-04-09

### Other

- Add .vundles.local to allow per-installation plugin customization

Adding and removing vim plugins is now done by adding and removing
from ~/.vim/.vundles.local. This file is sourced at the end of
vundles.vim

Fixes #275

## 2013-04-30

### Other

- Merge pull request #303 from lfilho/ack2ag

Switching from Ack to Ag

## 2013-04-25

### Other

- Switching from Ack to Ag

## 2013-04-30

### Other

- Merge pull request #313 from lfilho/faster-git-compl

Adding hack to make git completion faster for local stuff

## 2013-04-29

### Other

- Adding hack to make git completion faster for local stuff

## 2013-04-25

### Other

- Merge pull request #308 from jravetch/patch-1

Remove old reference to tab navigation

## 2013-04-23

### Other

- Remove old reference to tab navigation
- Merge pull request #304 from petRUShka/load-ssh-agent

Fix: [Zsh] load ssh-agent module

## 2013-04-18

### Other

- [Zsh] load ssh-agent module

## 2013-04-17

### Other

- Merge pull request #301 from lfilho/insensitive-search

Externalizing and improving search configuration
- Externalizing and improving search configuration

## 2013-04-16

### Other

- Revert numbers.vim causing relative numbering issue

## 2013-04-15

### Other

- Disable automatic switch of line numbers

Fixes #296

## 2013-04-10

### Other

- Updated pry readme to reference jazz_hands gem
- Update plugin mgmt help on README.md

We now have a working yadr vim-delete-plugin

## 2013-04-09

### Other

- Add numbers.vim to vundles.list

numbers.vim is a plugin that allows for easy switch between
absolute and relative line numbers.
A convenient shortcut: ,tn (toggle numbers) is provided to
switch between the two modes

Fixes #276
- Add fugitive navigation enhancements

The tree buffer makes it easy to drill down through the directories of
your git repository, but it’s not obvious how you could go up a level to
the parent directory. This new mappings ".." helps.

## 2013-04-08

### Other

- Merge pull request #285 from lfilho/improved-semicolon-insertion

Improved semicolon insertion

## 2013-04-06

### Other

- Improving semicolon insertion at the end of the line

## 2013-04-08

### Other

- Merge pull request #287 from lfilho/visual-star-search

Adding visual star search vundle

## 2013-04-06

### Other

- Fixing typo in the readme
- Updating the readme with the visual star search plugin
- Adding visual star search vundle

## 2013-04-08

### Other

- Merge pull request #289 from skwp/visual_sel_aft_indent

Change indent/unindent behaviour in visual mode

## 2013-04-07

### Other

- Change indent/unindent behaviour in visual mode

After indenting/unindenting the selected lines of code, vim
deselects forcing the user to reapply the selection in order to
indent multiple times.

This remap fixes the problem.

## 2013-04-08

### Other

- Merge pull request #288 from skwp/easy_install

Change installation script

## 2013-04-07

### Other

- Change installation script

Instead of asking the user to clone the repo and running rake
install, there's is now an easy .sh script that can be downloaded
and invoked in a single line.

The script takes a parameter "ask" if the use prefers to control
which modules of yadr are installed.

## 2013-04-08

### Other

- Merge pull request #290 from skwp/iterm2_solarized_autoinstall

Add autoinstall of Solarized iTerm2 themes

## 2013-04-07

### Other

- Add solarized theme to console vim
- Add autoinstall of Solarized iTerm2 themes

The rake script now detects the available iTerm2 profiles and
installs the solarized scheme where needed.

It's an interactive procedure that requires selection by the user.
- Remove auto run of CoffeeMake! on *.coffee files

Fixes #278

## 2013-04-04

### Other

- Merge pull request #283 from jby/snippet-fix

Replaced honza/snipmate-snippets with honza/vim-snippets
- Replaced honza/snipmate-snippets with honza/vim-snippets since it seem upstream changed name

## 2013-04-02

### Other

- Fix a bug that was causing .vim.after to be removed after update

rake install/update was executing git clean with the -x flag that
force the removal of ignored files. Since .vim.after was listed
inside .gitignore, this was causing the file to be removed on
each update.
I don't think we need to remove ignored files since are all
temporary or user-specific configuration files that should
persist between updates.

Fixes #225

## 2013-04-01

### Other

- Revert "Add support for sourcing the right rvm env on bufenter"

This reverts commit 2521763858432cec5a4ecbfa19786c5bf0234a18.
- Added @duhanebel to contributors list
- Merge pull request #273 from duhanebel/rvm_bundler

Add support for automatically sourcing the right rvm env

## 2013-03-30

### Other

- Add support for sourcing the right rvm env on bufenter

This extra configuration plugin calls :Rvm on every BufEnter
making sure that the right GEM_HOME and GEM_PATH are
set.
- Add tpope/vim-rvm to the plugin list

tpope/bundler won't work without this plugin on a project
that uses dvm when mvim is not launched from within the
project's directory.
Using the command :Rvm will source the right GEM_HOME
so that :Bedit [gem] is able to look in the right place.

## 2013-04-01

### Other

- Merge pull request #274 from duhanebel/update_readme

Remove csapprox from the README

## 2013-03-30

### Other

- Remove csapprox from the README

csapprox has been removed from the list of default vundles so it
shouldn't be listed on the README anymore

## 2013-03-29

### Other

- Fix setting of Gsearch to silver searcher ag
- Remove bogus bundle
- Fix path to file-line bundle
- Added changelog
- Install latest zsh from brew
- Add back file-line after undle migration
- Fix missing path to promptinit
- Migrate to Vundle! Be sure to run rake :update

* duhanebel/vundle_migration:
  Remove "press a key to continue" before vundle_install
  Fix a bug preventing the correct update of vim
  Change duhanebel's forked repos to originals
  Fix a typo on the Rakefile
  Fix a bug that was preventing a clean install
  Change rake file to reuse methods in vundle.rb
  Update zsh alias to support new yadr's commands
  Add yadr command line tools to remove/list plugins
  Update yadr's binary to support Vundle
  Update Rakefile to manage pathogen-to-vundle upgrade
  Remove csapprox
  Move mapleader definition to vimrc
  Change vimrc to use Vundle instead of pathogen
  Add bundle to .gitignore
  Remove all vim submodules

Conflicts:
	.gitmodules

## 2013-03-25

### Other

- Remove "press a key to continue" before vundle_install
- Fix a bug preventing the correct update of vim

Somehow I forgot to execute "install" after the vundle migration
on the "update" task

## 2013-03-21

### Other

- Change duhanebel's forked repos to originals

Both powerline and syntastic on the default vundles.vim were
pointing to my own forks, which are not needed for the main repo.
- Fix a typo on the Rakefile

## 2013-03-20

### Other

- Fix a bug that was preventing a clean install

The installation of the plugin only happened during an update
because the code that checks out the vundle plugin was in the
wrong place.

## 2013-03-17

### Other

- Change rake file to reuse methods in vundle.rb

Vundle::update_vundle can be reused inside the Rakefile
- Update zsh alias to support new yadr's commands

yrv -> deletes plugin
ylv -> lists plugins
- Add yadr command line tools to remove/list plugins

Two new command line tools: yadr-vim-remove-plugin and
yadr-vim-list-plugin do what they're supposed to.
- Update yadr's binary to support Vundle

yadr-vim-add-plugin now supports adding vundle plugins

## 2013-03-16

### Other

- Update Rakefile to manage pathogen-to-vundle upgrade

The Rakefile now detects if pathogen is installed and in that case
it performs the following operations:
1. Moves vim/bundle to vim/bundle.old
2. Removes all the submodules from git config and cache
3. Initializes and updates the new submodules (zsh and bundle)
4. Runs the vundle installer that takes care of the rest
- Remove csapprox

Since we're now able to install Solarized on iTerm2, there's no
need for approximating the theme when using vim instead of
mvim. In fact, using csapprox on iTerm2 with solarized installed
breaks the theme completely.
- Move mapleader definition to vimrc

It seems that the mapleader has to be defined before vundle starts
to load the plugins. For this reason, I moved it from yadr-keymap
back into the vimrc. I'm sure it's not a big deal having the leader
mapped under the "general config" instead of inside settings.
- Change vimrc to use Vundle instead of pathogen
- Add bundle to .gitignore

Bundles are now handled via Vundle so there's no need to monitor
the bundle directory as everything is done through the :Bundle
command
- Remove all vim submodules

## 2013-03-29

### Other

- Use silver searcher for lightning fast :Gsearch

## 2013-03-24

### Other

- Merge pull request #270 from darylrobbins/master

User Git Config
- Updated README to describe new user Git configuration.

## 2013-03-23

### Other

- Added support for git user configuration. Gitconfig will now include the configuration from ~/.gitconfig.user, if it exists. The include is done at the end of gitconfig, so that it can override any of the default values.

## 2013-03-22

### Other

- Merge pull request #269 from petRUShka/master

Add vim-plugin for opening files like this `vim Rakefile:110`
- [VIM] added file-line plugin. Allows to open file and move to certain line like this vim Rakefile:110

## 2013-03-21

### Bug Fixes

- Fixes #268

### Other

- Merge pull request #266 from duhanebel/install_link_fix

Fix a bug that's causing the installer to overwrite backup files
- Fix a bug that's causing the installer to overwrite backup files

When rake install/update is run for the second time, any .backup
file created by the first run it's going to be overwritten by
the new symlink even if the current file is the same as the one
we are going to write.

The rakefile now checks if the symlink we are going to create
points to the same target as the one already there and if that's
the case, doesn't overwrite any backup.
- Merge pull request #268 from chadkouse/env_shell

"uninitialized constant SHELL" in zsh install step
- Merge pull request #265 from duhanebel/zsh_install_check

Fix a bug that was causing rake to overwrite SHELL settings
- Fix a bug that was causing rake to overwrite SHELL settings

The prezto install procedure now checks to make sure the user
doesn't have an alternative version of zsh installed before changing
the current shell preference with "chsh".
This may be the case when an user is already using zsh but on a
different version from the one shipped with OS X

Fixes #264

## 2013-03-14

### Other

- Merge pull request #259 from duhanebel/iterm_solarized

Add solarized themes for iTerm2
- Add solarized themes for iTerm2

Both solarized dark and light are now included in the subdir
iTerm2. They are copies from the original repo because it doesn't
seem worth to clone a ~10Mb repo just to keep in sync 2 files,
considering that solarized hasn't changed much in the past years.

The rakefile has been updated to trigger the automatic installation
of these two themes only if OS == OSX. The user will still have
to set the themes for his/her current profile manually (but that's
explained at the end of the installation process).

## 2013-03-08

### Other

- Revert "Added ,mm to switch to mailer while in view"

Conflicted with showmarks in an ugly way
This reverts commit 44a2cd79d09aea86c464d4880d5fdfe8b378d7ce.
- Added ,mm to switch to mailer while in view
- Updated subprojects

## 2013-03-07

### Other

- Merge pull request #250 from kmees/issue_249

Renamed vim/plugion/settings/fugitive.git to vim/plugin/settings/fugitiv...

## 2013-02-28

### Other

- Renamed vim/plugion/settings/fugitive.git to vim/plugin/settings/fugitive.vim. Fixes issue #249

## 2013-03-07

### Other

- Removed unused plugin ruby_focused_unit_test

## 2013-02-27

### Other

- Readme cleanup
- Removed unused / not working ,,f ,,F aliases

## 2013-02-26

### Other

- Merge pull request #247 from irrationalfab/vim-gitgutter

Add gitgutter
- Add gitgutter

## 2013-02-21

### Other

- Remove gitgutter; causes errors
- Upgrade plugins
- Merge pull request #246 from irrationalfab/vim-gitgutter

Added vim-gitgutter, which shows git diff in the gutter
- Added vim-gitgutter, which shows git diff in the gutter
- Upgrade plugins

## 2013-02-16

### Other

- Remove arpeggio; unused
- Improved sass colors

## 2013-02-06

### Other

- Vim plugins and prezto updated
- Merge pull request #243 from gonzedge/submodules-init

Remove unused submodules directories.

## 2013-02-05

### Other

- Remove unused submodules directories.

Running `rake install`, runs the `:submodule_init` task,
which in turn runs the following command:

    git submodule update --init --recursive

This fails with the following couple of errors (separately):

    No submodule mapping found in .gitmodules for path 'vim/bundle/mattn-zencoding-vim'
    No submodule mapping found in .gitmodules for path 'vim/bundle/skwp-vim-indexed-search'

This was introduced by 3d60f721dd53e7f5414d11004c749784efc74f64
which removed the 'mattn/zencoding-vim' and 'skwp/vim-indexed-search'
submodules from the `.gitmodules`.

## 2013-02-04

### Other

- Revert "Add quickfixsigns module - shows which lines changed"

This reverts commit ae8946dbb2b45c6086b0d7615e10fd8656a7d4d6.
- Merge pull request #241 from calavera/skip-homebrew-install

Skip homebrew install if it's already in the path

## 2013-01-26

### Other

- Follow code style.
- Install homebrew only if it's not in the path already.

## 2013-01-05

### Other

- Do not install brew

## 2013-02-04

### Other

- Merge pull request #237 from rafaelregis/aliases_cleanup

Aliases cleanup

## 2013-01-18

### Other

- Delete yuv alias, as asked by the comment.

## 2013-01-17

### Other

- Use vim instead of vi.

- vi command uses vim that comes with the system instead of the one of MacVim.
- Remove '..' alias.

- cd ..; cd ../..; cd ../../..; cd ../../../.. are aliased by
  default on zsh to ..; ...; ....; ..... respectively.

## 2013-02-04

### Other

- Merge pull request #239 from lfilho/master

Removing duplicated vim plugins

## 2013-01-24

### Other

- Removing duplicated vim plugins

## 2013-02-04

### Other

- Merge pull request #242 from szajbus/skwp

updated vim nerdtree tabs plugin

## 2013-01-27

### Other

- Updated vim nerdtree tabs plugin

## 2013-01-23

### Other

- Add quickfixsigns module - shows which lines changed

## 2013-01-17

### Other

- Merge pull request #235 from rafaelregis/fix_vim_alias

Fixed vim alias.

## 2013-01-10

### Other

- Fixed vim alias.

- Only set vim alias if MacVim is installed (using homebrew or not)
- Merge pull request #236 from giorni/slim-update

Updated vim-slim submodule.
- Updated vim-slim submodule.
- Sprintly alias
- Added ,gt html tidy command
- Color improvement

## 2013-01-07

### Other

- Merge pull request #231 from andyattebery/master

Removed vim-slim submodule
- Removed vim-slim submodule

## 2013-01-06

### Other

- Merge pull request #230 from treppo/patch-1

Configure Macvim as the standard git mergetool
- Configure Macvim as the standard git mergetool

Why use something else than Macvim with fugitive.vim as a mergetool?

## 2013-01-02

### Other

- Merge pull request #228 from alikaragoz/master

Fix issue to take into account the ASK environnement variable

## 2012-12-26

### Other

- Fixed issue where the ASK environnement variable..

was not taken into account when doing a ASK=true rake install

## 2012-12-10

### Other

- Fix cmd-j and cmd-k navigate by function bindings

## 2012-12-01

### Other

- Merge pull request #220 from lukeorland/vim-jade-url

change vim-jade submodule URL from git:// to https://

## 2012-11-28

### Other

- Change vim-jade submodule URL from git:// to https://

## 2012-12-01

### Other

- Merge pull request #223 from jasonwbarnett/added-license

added LICENSE
- Copy and pasted too much from wikipedia
- Added LICENSE

## 2012-11-30

### Other

- Removed esc-l and esc-. bindings messing with vim in zsh

## 2012-11-28

### Other

- Removed zoomwin - messes with syntax highlighting
- Added hub command for github interaction
- Rbf abbreviation for rspec before block
- Better sass colors

## 2012-11-26

### Other

- Automatically use zshell

## 2012-11-20

### Other

- Ensure EDITOR/VISUAL vars set to vim [Fix #217]
- Better colors, readme update
- Remove SearchComplete plugin - too much grief

This plugin was causing issues with numerous other plugins
including the ctrl-shift-e expansion of html and ConqueTerm

## 2012-11-17

### Other

- Improve colors in normal vi [Fix #216]

## 2012-11-16

### Other

- Cl! abbreviation for logging, and ;; for closing javascript lines
- Undo zm mapping which conflicts with folding. Jump to method now Cmd-Shift-M
- Remapped ,m to zm due to conflict with ShowMarks
- Fix 'ga *foo*' by not globbing git
- Improved vim colors
- Fix skwp and kylewest themes - ensure git-info is on [Fix #213]
- Font improvement: Inconsolata XL
- Bundles for better javascript highlighting and tag highlighting

## 2012-11-13

### Other

- Bring back keybindings to enable vim mode and ctrl-R [Fix #212]

This reverts commit 686e8d706fedb667c2b905564b79d7daec7e0e96.
- Rdebugrc [Fix #189]
- Upgraded vim plugins
- Sprintly alias
- Prevent neocomplcache hanging in python [Fix #163]
- Merge pull request #214 from irrationalfab/vim-spell

Added `vim/spell` to gitignore.
- Added `vim/spell` to gitignore.

## 2012-11-12

### Other

- Added tmux support [Fix #190]
- Fix pointer to PCKeyboardHack [Fix #200]

## 2012-11-10

### Other

- Merge pull request #206 from kylewest/kylewest-prezto-theme

kylewest theme

## 2012-11-06

### Other

- Cleanup RPROMPT
- Kylewest theme

## 2012-11-10

### Other

- Merge pull request #207 from kylewest/skwp-theme-cleanup

refactor skwp theme in the "prezto" style

## 2012-11-06

### Refactoring

- Refactor skwp theme in the "prezto" style

## 2012-11-10

### Other

- Upgrade vim plugins
- Enable vi mode in the prompt
- Remove highlighters to fix beep [fixes #199]
- Enable ssh-agent forwarding
- Removed redundant $PATH
- Remove rvm, part of prezto ruby module
- Remove key-bindings, part of prezto
- Remove color-man-pages, part of prezto
- Load prezto modules
- Enable all syntax highlighters
- Update to latest zpreztorc from prezto repository

### Refactoring

- Refactor skwp theme in the "prezto" style

## 2012-11-09

### Other

- A few new git aliases
- Add ragtag plugin - Ctrl-x,/ to close html tags

## 2012-11-06

### Other

- Merge pull request #204 from tUrG0n/master

Added jade support
- Added vim-jade sub-module
- Removed vim-jade
- Added vim-jade plugin

## 2012-10-25

### Other

- Go back to emacs binding - it broke Ctrl-C
- Disable bell [Fix #199]
- Upgraded vim submodules
- Simplified installation: no more questions. It overwrites stuff and leaves backups by default. [Fix #197, #175]
- Ship custom zpreztorc with syntax highlight, history substring search [Fix #191]

## 2012-10-24

### Other

- Zeus and rspec aliases
- Stash aliases
- Merge pull request #195 from cap10morgan/rbenv-skwp-prompt

support rbenv version in skwp prompt

## 2012-10-23

### Other

- Ask rbenv for current version instead of reading rbenv/version file
- Support rbenv version in skwp prompt
- Merge pull request #188 from maletor/patch-1

Update chrome/Custom.css

## 2012-10-20

### Other

- Update chrome/Custom.css

## 2012-10-19

### Other

- Updated plugins
- Don't clobber zprezto files if they exist [CLose #172]

## 2012-10-18

### Other

- Update plugins, replace ShowMarks (again)

## 2012-10-16

### Other

- Moved defunkt module
- Added ignore dirty statements

## 2012-10-14

### Other

- Added mail index rebuild script

from: http://apple.stackexchange.com/questions/40258/mail-app-5-1-is-unusually-slow

## 2012-10-12

### Other

- A little cleaner under linux

I'm not explicitly supporting linux, but a few minor changes
make YADR useable for server administration.
- Removed bogus symlink

## 2012-10-10

### Other

- Fix installation (upgrade was working ok)

## 2012-10-09

### Other

- Github flavored markdown support
- Added ,,F to do same as ,,f in a vertical split
- Changed jump to ruby method to ,,f so as not to conflict with carriage return
- Improve the way submodules are updated [Close #153]

Also updated all plugins to their latest master versions.
- Prevent pasting in visual mode from overwriting paste buffer
- Removed erroneous comments
- Implement jump to ruby method (bang-aware)

It always annoyed me that vim jump-to-tag (ctrl-] or ,f in yadr)
totally flopped when it came to ruby bang methods. This function
handles methods! and method.invocations! to find bang versions
of methods.

## 2012-10-08

### Other

- Ignore whitespace in git diffs; a few aliases

## 2012-10-04

### Other

- Merge pull request #176 from brotbert/linux-no-homebrew-and-font-install

don't try to install homebrew and fonts on linux-based systems
- Don't try to install homebrew and fonts on linux-based systems

## 2012-10-03

### Other

- Added bundler rvm support

See http://robots.thoughtbot.com/post/15346721484/use-bundlers-binstubs
- When opening nerdtree wtih C-\ ensure consistent sizing

## 2012-10-02

### Other

- Added  outer ruby block functionality

## 2012-10-01

### Other

- Added ghi github issues command line interface

## 2012-09-28

### Other

- Simplify install: Move font, homebrew installation into rake installer
- Updated to latest vim-powerline
- Override rm alias so that it doesn't prompt every time

## 2012-09-27

### Other

- Clean up location of ~/.yadr
- Ensure prezto and other submodules are correctly installed recursive [Close #170]
- Better installation of fasd [Close #123]

Now with zsh tab completion for `z` and other fasd commands!
- Made ,gf / ctrl-f aware of line numbers

Now you can `,gf` or can `ctrl-f` file.rb:123
- Merge pull request #169 from giorni/slim-support

Added support for slim syntax
- Added support for slim syntax
- Latest version of plugins
- Switch prezto to point to master [#167]
- Automatically load ~/.secrets [Close #166]

## 2012-09-26

### Other

- Added abolish.vim for camelcase/underscore toggling and others
- Switch between running rspec1 and rspec2 with `:Rspec1` and `:Rspec2`
- Update version to 1.0
- Switched to @skwp fork of YankRing without evil @ mapping
- Remove creation of unnecessary symlink [Close #164]
- Ability to store your own prompts in ~/.zsh.prompts [Close #152]

We no longer pollute yadr or prezto directories with custom code!
- Latest fasd
- Prezto support! Make sure you run rake:install

## 2012-09-06

### Other

- Update prezto submodule

## 2012-08-10

### Other

- Set correct PDIR location in zshenv
- Moved to experimental Prezto branch

## 2012-08-09

### Other

- Add simple Prezto installation
- Add Prezto submodule
- Remove zsh/prezto custom directory in favor of submodule
- Swap all references of oh-my-zsh to Prezto

## 2012-09-26

### Other

- Added NrrwRgn plugin

## 2012-09-19

### Other

- Latest versions of vim plugins

## 2012-09-18

### Other

- Better javascript parsing libraries
- Updated to latest version of vim-ruby-conque

## 2012-09-14

### Other

- Hardcode location of .yadr

Occasionally it is slow on the find command. This code has no reason to be.

## 2012-09-13

### Other

- Merge pull request #161 from tUrG0n/patch-3

Always show powerline even with one window open.
- Fixed bug in #160

## 2012-09-11

### Other

- Added  for html preview in Safari
- Improve color of grep to yellow

## 2012-08-22

### Other

- Merge pull request #141 from corroded/relative_vim_overrides

Uses vim/after directory instead of root for custom vimrc.after
- Added vimrc.after to gitignore
- Updated README

## 2012-08-21

### Other

- Added original implementation for janus overrides
- Uses vim/after directory instead of root for custom vimrc.after

## 2012-08-10

### Other

- Remove git.zsh, it is not useful [Close #135]

## 2012-08-09

### Other

- Handle systems without rvm [Close #130]

## 2012-08-08

### Other

- Updated reference to prezto (omz sorin)
- Enabling theme changes when using prezto through zsh before
(cherry picked from commit 1cccb0e9c522654b7976bea047ed6f9f221ee510)
- Merge pull request #127 from JeanMertz/patch-1

Update homebrew install script url
- Update homebrew install script url

Home homebrew install Gist (https://raw.github.com/gist/323731) has been removed. New link (https://raw.github.com/mxcl/homebrew/go) taken from official website (http://mxcl.github.com/homebrew/)
- Merge pull request #129 from JeanMertz/patch-2

Update link to @sorin-ionescu Oh My Zsh
- Update link to @sorin-ionescu Oh My Zsh

Oh My Zsh fork now renamed to Prezto

## 2012-07-26

### Other

- Ctags file for better parsing of ruby,js

## 2012-07-21

### Other

- Remove bogus unmap

## 2012-07-20

### Other

- Resolve #122 unmap yankring @ in after file.

`nmap @` is not yet set when `vim/plugin/settings/yankring.vim` is
loaded. Moved nunmap @ to `vim/after/plugin/yankring.vim` because
it is loaded after the plugin is finished loading.

## 2012-07-19

### Other

- Upgraded plugins

## 2012-07-16

### Other

- Added SearchComplete tab completion when searching with /

## 2012-07-10

### Other

- Marky the markdownifier
- Don't explicitly load plugins [Close #118]
- Change ,bf mapping conflicting with buffer list ,b
- Add back Rails2-compatible console alias 'co'

## 2012-06-23

### Other

- Merge pull request #115 from bastnic/patch-2

Handle homebrew sbin executables

## 2012-06-18

### Other

- Handle homebrew sbin executables

## 2012-06-23

### Other

- Fixing omodload: no such module: alias issue (#111)

## 2012-06-20

### Other

- Fixing omodload: no such module: alias issue (#111)

## 2012-06-22

### Other

- Remove duplication in readme
- Added ,bf mapping to add before { } block
- Updated README for yankring
- Restore YankRing plugin to functionality
- Gcp git cherry pick alias

## 2012-06-14

### Other

- Merge pull request #112 from mplatts/patch-1

Rails console alias updated for Rails 3
- Rails console alias updated for Rails 3

## 2012-06-11

### Other

- Make ,qc also close conques
- Never nuke a NERDTree using Q

## 2012-06-08

### Other

- Changed default ,t binding do use CtrlP mixed mode

The mixed mode is more intelligent, searching buffers, MRU, and
the general file list. It gives you more of what you want, and
less of what you don't :)

## 2012-06-07

### Other

- Make ctrlp play nice with vim-ruby-conque by closing its window
- Fix install/submodule update problem with skwp-vim-powerline [Close #105]

Updated submodules to latestk
- Added vim-ruby-debugger - real ide style debugging in vim
- Made conque and gitgrep play nice with each other by killing each other's windows to prevent sizing problems
- ,vv and ,cc to open view and controller in rails

## 2012-06-02

### Other

- Auto create undodir [Close #103]

## 2012-05-31

### Other

- Upgraded all plugins to most recent
- Added some rake aliases

## 2012-05-30

### Other

- Fix errors if pry-nav is unavailable
- Merged spec finder and conque spec runner into one plugin
- Gbd for branch deletion; portforward for 80:3000 forwarding
- Upgraded spec-finder
- Updated visual select mode to retain syntax highlighting

## 2012-05-26

### Other

- Merge pull request #106 from n0nick/master

Adding webapi-vim.

## 2012-05-23

### Other

- Adding webapi-vim.

webapi-vim is a Vim interface to Web APIs.
It is required by Gist.vim (already part of YADR)
to be able to post gists to Github via OAuth2.
See https://github.com/mattn/webapi-vim for details.
Gist.vim requirements note: http://git.io/pwMo9A#requirements
- Fix evil submodule code introduced in 3525561

## 2012-05-22

### Other

- Merge pull request #102 from irrationalfab/master

Enable spell checking for git commits.

## 2012-05-15

### Other

- Enable spell checking for git commits.

Source: http://stackoverflow.com/questions/1691060/vim-set-spell-in-file-git-commit-editmsg

## 2012-05-22

### Other

- Merge pull request #104 from n0nick/master

Adding vim-less bundle.

## 2012-05-20

### Other

- Adding vim-less bundle.

This vim bundle adds syntax highlighting, indenting and
autocompletion for the dynamic stylesheet language LESS.
See https://github.com/groenewege/vim-less for details.

## 2012-05-19

### Other

- Added information about pry-nav for ruby debugging

## 2012-05-18

### Other

- Added editrc/inputrc for vimification of mysql/irb command line tools

## 2012-05-15

### Other

- Switch to @skwp fork of EasyMotion for vimperator style two character targets
- Added Cmd-), Cmd-] and etc for modifying content inside surrounds
- Add common abbreviations

## 2012-05-10

### Other

- More vim surround shortcuts ,} ,] ,) ,' etc

## 2012-05-08

### Other

- ,# and ," for wrapping words in ruby interpolation or quotes
- Added rake.vim, like rails.vim but for any project with a rakefile

## 2012-05-03

### Other

- Added vim-bundler with :Bopen to browse bundled gem code
- Added ,m and ,M jump-to-method(tag) via CtrlP

## 2012-05-02

### Other

- Updated plugins

## 2012-04-27

### Other

- Moved spec opener to externalized plugin
- Added ,ocf for opening changed files (stolen from @garybernhardt)
- Updated readme with new instructions for OMZ

## 2012-04-26

### Other

- Added `Ctrl-s` to open spec for any file you're looking at

Similar to rails.vim's :A and :AV command, except it knows
about fast_spec. Could be expanded in the future to add more
spec paths.

## 2012-04-24

### Other

- Added ctrl-a and ctrl-e end and beginning of line bindings [Close #94]
- Upgraded vim plugins
- Added `,Cmd-R` to rerun last conque commend (re-exec spec)
- Updated vim-ruby-conque not to warn on spec/rspec missing [Close #92]

## 2012-04-23

### Other

- Merge pull request #91 from msaffitz/master

Fix typo in Rakefile : zsh_theme
- Fix for typo in zsh_themes install
- Support for @sorin-ionescu rewrite of oh-my-zsh

Sorin's OMZ rewrite is a bit nicer, as it's written in more
native style ZSH, doesn't do auto updates, and incorporates
many bugfixes, and is more actively maintained than Robby's branch.

For now, YADR supports both, so if you want to try out the sorin
branch, go to sorin-ionescu/oh-my-zsh, install it, and rerun
the YADR installer so that the skwp theme is installed for you.

If you want to have them side by side for comparison, rename the
old robby one to ~/.oh-my-zsh.robby or similar, so you can toggle
back and forth through renames, or symlinks.
- Moved rvm configuration to separate zsh snippet to keep zshrc clean

## 2012-04-20

### Other

- Renamed grc alias to not conflict with grc colorization tool
- Better colors for ruby
- Add zsh syntax highlighting
- Added Ctrl-x,Ctrl-l to zsh to insert output of last command

## 2012-04-19

### Other

- Upgraded to latest osx defaults from @mathiasbynens
- Remove unused statusline, powerline.vim is used
- Unmap the arrow keys, use Cmd-Arrow keys instead for window resize

## 2012-04-18

### Other

- Added Specky for rspec highlighting outside spec/

If you have rspecs anywhere else (say fast_spec/), the
default rails.vim highlighting doesn't affect them. Added
Specky to do this. Specky is not currently enabled in any other
way (we will still use ruby-vim-conque to run tests, but Specky
will do highlighting/file detection).

## 2012-04-16

### Other

- Upgraded vim-ruby-conque with nice j/k/n/p/f/q keybindings
- Upgraded vim-ruby-conque
- Remove hardcoding to use rspec1. The plugin will determine which one you have
- Remove enter to clear highlight, interferes with quickfix window
- Remove arpeggio fd and jk because they interfere with Cmd-j, Cmd-k
- Removed Slime plugin, unused and interferes with Ctrl-c
- Vim mappings: Ctrl-l for => and arrow keys to window resize
- Updated custom zsh paths in README. Fixes #87.
- Remove imagemagick from instructions, not needed

## 2012-04-15

### Other

- Upgraded plugins

## 2012-04-14

### Other

- Highlighting for zsh scripts
- Open NERDTree on startup
- Remove extra zsh plugins. [Close #78]

Use .yadr/custom/zsh/before if you want your own list of plugins.
- Added `,cn` to copy name of current file into system clipboard

## 2012-04-11

### Other

- Merge pull request #86 from Omer/master

Incorrect PATH to Google Chrome's Custom CSS.

## 2012-04-10

### Other

- Incorrect PATH to Google Chrome's Custom CSS.

Missing 'User Stylesheets' folder.

On the way:
- Changed the directory location to a relative path.
- Created a symlink instead of copying the stylesheet.
- Added back timcharper-textile as a submodule

## 2012-04-07

### Other

- Deleted timcharper-textile
- Upgraded plugins
- Merge pull request #85 from NilsHaldenwang/master

Adds missing ignore = dirty to .gitmodules

## 2012-04-06

### Other

- Adds missing ignore dirty.

## 2012-04-07

### Other

- Merge pull request #82 from markcornick/fix_gitignore

Fix excludes file in gitconfig

## 2012-04-06

### Other

- Fix excludes file in gitconfig

It was pointing to .yadr/gitignore_global, a symlink that no longer
exits. Point it to .yadr/git/gitignore instead.
- Merge pull request #84 from kylewest/kylewest-theme

kylewest zsh theme with vi insert/command mode indicator
- Added screenshot of theme.
- Added my theme.
- Made skwp theme safe for those without rvm. [fixes #80]

## 2012-04-05

### Other

- Load zsh customizations from custom/zsh/before/* and custom/zsh/after/* instead of filename globbing [Close #79]

 * File pattern globbing was too brittle. If you had plugins incorrectly
   named, or had only a before or after directory, things would break in
   nonobvious ways.
- Remove unused ,zz binding interfering with ,z previous buffer
- Fixed refrence to :ColorToggle plugin
- Removed duplicate load of vimrc.after [Close #73]
- Removed duplicate sourcing of vimrc.after. The other loads later and should be kept. Fixes #73
- Upgraded plugins
- Change ,cf to give you the filename relative to your home dir
- Merge pull request #72 from p7k/master

Docs typo fix
- Typo fix in docs
- Fix link to zsh/aliases broken by previous
- Merge remote-tracking branch 'kylewest/symlinks'

* kylewest/symlinks:
  Removed symlinks.

## 2012-04-02

### Other

- Removed symlinks.

## 2012-04-04

### Other

- Added ',hi' to see the current highlight group
- Remove VimBookmarking, not working, not used
- Syntax highlighting for textile

## 2012-04-02

### Other

- Fix overzealous wildignore causing 'blog' directory to disappear [Close #70]
- Add change-inside-surroundings plugin [Close #68]
- Fix path to yadr bins [Close #69]
- Ensure path loads first
- Added yadr bin path
- Merge pull request #67 from markcornick/fix-install

Fix stray backtick causing installer errors
- Fix stray backtick causing installer errors

There's a stray backtick in the Rakefile which causes the installer to
fail copying files. This commit removes the backtick and relocates a
right brace to make everything work properly.
- Ability to customize zsh in ~/.yadr/custom/zsh folder

 * Split zsh config into snippets in zsh/ folder, similar to vim
 * Feature implementation by @kylewest

* kylewest/zsh:
  Documentation for customizing ZSH.
  Only init fasd if it is installed.
  Removed brew and github plugins.
  updated .gitignore for new zsh paths.
  simplifying paths for zsh customization.
  added zsh aliases. Moved other files but left symlinks for backwards compatibility.
  automatically load RVM or rbenv.
  updated .gitignore
  adding sample zsh configs.
  added directories and code for custom zsh configuration.

## 2012-03-23

### Other

- Documentation for customizing ZSH.
- Merged upstream/master.

## 2012-03-22

### Other

- Only init fasd if it is installed.

## 2012-03-21

### Other

- Merge master branch.

## 2012-03-01

### Other

- Merge master
- Removed brew and github plugins.

ZSH was becoming slow. Research suggested these plugins were to blame.

http://superuser.com/questions/236953/zsh-starts-incredibly-slowly

## 2012-01-31

### Other

- Updated .gitignore for new zsh paths.
- Simplifying paths for zsh customization.
- Merge branch 'master' into zsh

* master:
  yankring history should be hidden.
  added gemrc and updated documentation.
- Added zsh aliases. Moved other files but left symlinks for backwards compatibility.
- Automatically load RVM or rbenv.
- Updated .gitignore
- Adding sample zsh configs.
- Added directories and code for custom zsh configuration.

## 2012-04-01

### Other

- Replaced Extradite with gitv. Use :gitv

 * For optimal functionality, remove module:
   `rm -rf .yadr/vim/bundle/int3-vim-extradite`

## 2012-03-29

### Other

- Added ,gcf - git grep references to current file

## 2012-03-22

### Other

- Added zsh skwp.theme to installer, so we don't rely on my zsh fork anymore

## 2012-03-20

### Other

- Switched to skwp/vim-conque to replace rson/vim-conque for solarized support

## 2012-03-19

### Other

- Added fasd for quick filesystem navigation

## 2012-03-15

### Other

- Upgraded plugins

## 2012-03-14

### Other

- Merge pull request #54 from taybin/snippets_update

Update snippets to a more modern plugin from @garbas and @honza
- Add new snipmate plugin from garbas

- with snippets from honza (as recommended by garbas)
- with dependencies tlib and vim-addon-mw-utils
- Remove older, unsupported snipmate and snippets

## 2012-03-13

### Other

- Update README.md
- Updated powerline to use full path since Rails filenames are not always unique
- Merge pull request #52 from taybin/patch-1

Needed to get camelcasemotion to work inside commands such as dW
- Needed to get camelcasemotion to work inside commands such as dW
- Merge pull request #51 from taybin/zmv_taglist

Add zmv (zsh wildcard move) support and TagBar
- Fully remove taglist in favor of tagbar
- Turn on the amazing zmv

- alias it to use 'noglob zmv -W', so that you can do stuff like
   zmv foo.* bar.*
  to rename all foo files to bar files without annoying quoting.
http://grml.org/zsh/zsh-lovers.html#_zmv_examples_require_autoload_zmv
- Merge pull request #50 from taybin/camelcasemotion

add camelcasemotion with mappings to B, W, and E instead of ,b ,w and ,e
- Add camelcasemotion with mappings to B, W, and E instead of ,b ,w and ,e

- this avoids conflicts with ,b for Ctrlp's buffer selector and ,w for
  whitespace deletion.
- Add set visuabell. [Close #49]

## 2012-03-12

### Other

- Merge pull request #47 from maletor/master

History substring search and other useful plugins.
- Substring search
- Added color_highlight plugin
- Remove conflicting tab/window management bindings
- Change window navigation to Ctrl-h,j,k,l to avoid overriding vim defaults [Close #42]
- Ignore images in wildignore
- Latest version of skwp solarized powerline theme

## 2012-03-09

### Other

- Better wildignore for rails projects
- Added Arpeggio plugin for key chord combos and Filesystem      Size   Used  Avail Capacity  Mounted on
/dev/disk0s2   931Gi  481Gi  450Gi    52%    /
devfs          192Ki  192Ki    0Bi   100%    /dev
map -hosts       0Bi    0Bi    0Bi   100%    /net
map auto_home    0Bi    0Bi    0Bi   100%    /home
/dev/disk1s2    15Mi   15Mi    0Bi   100%    /Volumes/Flash Player
/dev/disk2s2   100Mi  100Mi    0Bi   100%    /Volumes/Google Chrome
/dev/disk4     5.0Mi  2.9Mi  2.1Mi    59%    /Volumes/KeyCastr
/dev/disk5     4.2Gi  4.2Gi    0Bi   100%    /Volumes/Blue in Green
/dev/disk6s2   100Mi   17Mi   83Mi    17%    /Volumes/MacScan Installer and  chords to go to beginning and end of line
- Upgrade haml and fugitive
- Update README.md
- Upgraded powerline and solarized to produce a solarized powerline
- Changed conflicting ,cc keymap to ,vc (execute vim command)

## 2012-03-08

### Other

- Added + and - for resizing vertical windows

## 2012-03-09

### Other

- Replaced vim-rspec with vim-ruby-conque bindings
- Removed unused file

## 2012-03-08

### Other

- Tweaks to skwp powerline theme
- Integrate vim-powerline with custom skwp theme
- Fix 'git l' (aliased to 'gl')  mapping which was not working
- Update all plugins
- Updated README with keymap debugging info
- Upgraded ctrlp

## 2012-03-07

### Other

- Upgrdae fugitive and solarized
- Added ,gf - go to file in vertical split
- Better colors for manpage search as suggested by @irrationalfab

## 2012-03-06

### Other

- Remove semicolon mapping; semicolon is used to repeat last find command
- Add support for ~/.vimrc.after
- Merge pull request #38 from irrationalfab/master

Less Colors for Man Pages
- Less Colors for Man Pages
- Replace showmarks due to deleted repo by @garbas [Close #39]
- Upgraded syntastic; Removed javaScriptLint plugin - replaced with syntastic

## 2012-02-28

### Other

- Compatibility with latest pry/coderay
- Explicitly load plugin files to ensure all keybindings are loaded [Close #24]
- Moved solarized mods to the solarized plugin to ensure colors are correctly loaded at startup
- Merge pull request #25 from winmillwill/master

Persistent Undo for CLI vim. MacVim is now required to come from brew.

## 2012-02-23

### Other

- Persistent undo for cli vim.

Also had to create the backups directory, not sure where to do that.

## 2012-02-28

### Other

- Merge pull request #31 from bastnic/patch-1

Change gitignore_global to yadr one

## 2012-02-25

### Other

- Change gitignore_global to yadr one

## 2012-02-28

### Other

- Merge pull request #33 from maletor/patch-2

Update chrome/install.sh
- Update chrome/install.sh

## 2012-02-24

### Other

- Merge pull request #29 from maletor/patch-1

Add homebrew path
- Add homebrew path
- Changed html escape and unescape mappings to ,he and ,hu [Closes #27]

## 2012-02-10

### Other

- ,z and ,x bindings to move back and forth through buffers

## 2012-02-07

### Other

- Upgraded ,gcp to really find references to current partial

## 2012-02-05

### Other

- Updated README re: skwp theme for oh-my-zsh
- ,gd alias for git-grepping a ruby function definition
- Added cmd-space to readme
- Do not try to source the .secrets file if there is none
(cherry picked from commit 0002a86a3f4cf5db8c7a623189cd08f8816dfa9d)

## 2012-01-31

### Other

- Merge pull request #21 from kylewest/yankring

yankring history should be hidden.
- Yankring history should be hidden.
- Merge pull request #20 from kylewest/gemrc

Added gemrc with automatic --no-ri --no-rdoc
- Added gemrc and updated documentation.

## 2012-01-30

### Other

- Better syntax highlighting for json in haml, vim

## 2012-01-27

### Other

- Add jslint for warnings on saving javascript file
- Merge pull request #13 from kylewest/simple-automated-install

Simple automated installer. Use: rake install
- Merge branch 'master' into simple-automated-install

* master:
  Fix ctrlp settings that conflict with Fugitive [closes #18]

## 2012-01-26

### Bug Fixes

- Fixed wrapping keymaps so they don't conflict with tabs.

### Other

- Fix ctrlp settings that conflict with Fugitive [closes #18]
- Merge master, fixed README conflicts.
- Merge pull request #14 from kylewest/vim-tweaks

Key bindings for wrapping, etc
- Is it possible to have tab 0? I don't think so, so I removed the mapping.

## 2012-01-25

### Other

- Merge branch 'master' into vim-tweaks
- Simple vimrc customizations. ~/.vimrc.before is loaded before everything. ~/.vimrc.after is loaded after all plugins load.
- Organized config files and suggested new naming convention (see settings/README).
- Added TODO to have certain file types automatically wrapped.
- Added function for wrapping text.

## 2012-01-26

### Other

- Merge pull request #17 from kylewest/master

README Formatting
- Fixed mistakes with an over-eager find/replace.
- More README formatting changes. No content changes.
- Readme formatting. No content changes.

## 2012-01-25

### Other

- Added ,F - find tag in vertical split window
- Improve window killer (Q) - close window if multiple windows to same buffer exist

## 2012-01-26

### Bug Fixes

- Fixed incorrect path for zsh symlinking.

## 2012-01-25

### Other

- Updated documentation for automated install.
- YADR can be installed to any directory and everything still works
- Added Rakefile. it symlinks from the repo to the home directory.
- Moved gitconfig and ignore to git directory. symlinks created but will be removed at some point.

## 2012-01-24

### Other

- Updated contributors in README
- Remap ,, to ,gz - Go Zoom a window
- Merge pull request #12 from kylewest/git

Git
- Removed lines marked TODO.
- More complete gitignore.
- Organized gitconfig. no breaking changes, couple new aliases.
- Merge pull request #11 from kylewest/cleanup

Further cleanups from kylewest
- Readme formatting. If only there was a vim plugin with GFM support.
- Changed prerequisites to dependencies in readme.
- Don't show me changes within submodules.
- Added instructions for setting up pre-requisitesi and fixing issues with ctags.
- Rbenv-version and rvmrc are no longer needed.
- Removed left over references to Command-T
- Merge pull request #10 from kylewest/simple-bug-fixes

Bugfixes from kylewest: reference to homebrew ctags, cleanup
- Remove Taglist settings.
- Merge branch 'master' into simple-bug-fixes
- Replace taglist with tagbar
- Remove CommandT and rebind ,t to CtrlP plugin
- More README tweaks, formatting for bash commands was wrong.
- More README formatting, cleanup, and general tweaks.
- Typo in the readme.
- Ctags is more compatible with OSX and homebrew.
- Updated readme with proper git user config.
- Added .rbenv-version and .rvmrc to ensure system ruby is used when compiling commandt.
- Added wildignore for ctrlp
- Added ctrl-p file finder, using file search by default
- Fix commit pointer to skwp-vim-ruby-conque

## 2012-01-23

### Other

- Better colors
- Add syntax highlighting for R language
- Upgrdaed submodules
- Chrome config: make web inspector fonts bigger
- Fix keybindings for fugitive: ,dg = :diffget
- Added coffeescript and stylus support

## 2012-01-21

### Other

- Make Ctrl-j and Ctrl-k quick up and down more intelligent in ruby
- Upgraded skwp-vim-ruby-conque: reuse same window
- Added textobj-function (use vaf to select a function), upgraded textobj-user
- Added steve losh next-textobject functionality. vinb to visual inside next set of parens
- ,K - Git grep up to next exclamation. Useful for ruby method grepping
- Use w!! to sudo write; Fixed up README file for comma leader
- ,q/ ,qg/ ,qa/ Quickfix search aliases inspired by Steve Losh
- Leader is now comma; General keymap cleanup - see README
- Upgraded skwp-vim-ruby-conque
- Hit <ctrl-space> to put spaces around an equals sign
- Better solarized support for jasmine.vim specs, ruby

## 2012-01-11

### Other

- Upgraded CommandT to fix BufLeave warnings
- Compile skwp-CommandT when running yadr-init-plugins
- Ignore subl binary
- Changed wincent-commandT to skwp-commandT in order to merge bugfixes
- Updated CommandT to latest version
- Added jasmine.vim for jasmin unit tests

## 2012-01-06

### Other

- Add Cmd-' and Cmd-" for change inside strings
- Upgrade skwp-vim-rspec
- Change whitespace cleaner to ,w
- Upgraded skwp-vim-ruby-conque. Run spec/etc in colorized window, reusing same window
- Added tabman plugin. Use \mt to manage all tabs and windows.

## 2012-01-04

### Other

- Fix typo: \gi should be \ig for indent guides

## 2012-01-03

### Other

- Added rspec pending to xit feature. Use: ,rxit

## 2012-01-02

### Other

- Added ,ws to strip trailing whitespace in a file

## 2011-12-30

### Other

- Upgraded nerdtree to latest
- Added sass-status plugin for viewing sass nesting in status bar

## 2011-12-27

### Other

- Use ctrl-H ctrl-L for switching tabs to avoid interfering with rspec plugin

## 2011-12-24

### Other

- Added vim-indent-guides, upgraded skwp-vim-rspec
- Remove autocmd causing problems. Add mapping for running specs

## 2011-12-23

### Other

- Jump to common rails dirs with ,jm ,jc ,jv ,jh  etc..using CommandT

LustyJuggler ,l[something] deprecated in favor of CommandT
because CommandT does fuzzy matching. Which means you can hit
,jm (jump to model) and fuzzy type a model name. Doing this
matches much more intelligently than a typical commandT call
because it's already constrained to what you want.

## 2011-12-22

### Other

- Changed 'Q' to intelligently close window or kill buffer if it's the last one
- Merge pull request #5 from durdn/master

Fixed your ,gg GitGrep mapping to close the quotes and put cursor in the middle
- GitGrep mapping ,gg now closes the quotes and puts the cursor in the middle. You only need to press enter.
- Removed dead plugin from readme
- Better colors for solarized search and cursor
- Upgraded vim-rspec to latest

## 2011-12-21

### Other

- Added gt 'git tag' alias
- Upgraded skwp-vim-rspec
- Upgraded skwp-vim-rspec
- New version of skwp-vim-rspec
- Minor keymap changs, README cleanup
- Added vim-rspec plugin forked from taq/vim-rspec, with fixes
- Make conqueTerm behave nicer when running long running commands inside it

## 2011-12-20

### Other

- Updated README with screenshot
- Improve visual select color, as well as CommandT
- Remove PeepOpen plugin, using CommandT only now
- Added new textobjects - ruby symbol (va:), function args (vaa)
- Added paging to pryrc by default

See pryrc comments for how to disable.

## 2011-12-19

### Other

- Reverted gitconfig to use vim, which seems to work better on Lion
- Added Extradite git log parser (use :Extradite with a file open)
- Do not open nerd tree on startup
- Added :Rfastspec command to find specs in fast_spec dir (or ,lf with lusty juggler)

## 2011-12-18

### Other

- Added example oh-my-zsh zshrc and instructions
- Added splitjoin plugin. Use sj and sk to split and join hashes into multiple lines.
- Don't use vim when committing from terminal
- Replaced align.vim with tabular.vim because it is more popular

## 2011-12-17

### Other

- Added align.vim plugin. Use :Align= to align by equals sign.
- Why YADR is not a Janus fork
- Vimrc cleanup - in clean easy to read sections

Moved appearance settings to plugin/settings/skwp-appearance.vim
- Custom surround.vim ability to wrap #{ruby} variables using s# motion
- Added yankring plugin - after pasting use Ctrl-p/n

Cycle through old pastes using Ctrl-p/Ctrl-n after
making a paste (using standard p character)
- Added ,oq for open quickfix, and ,q to close it
- Added gplr git pull --rebase alias

## 2011-12-16

### Other

- Added pre-alpha release note
- Added textxobj plugins for more awesome 'nouns'

vae - visual around entire (doc), vada visual around date
of course you can use any verb (c/d/y/v) with the ae/ai/ada/ida
nouns
- Anonymous bookmarking with ,bb ,bn ,bp ,bc
- Added ZoomWin and bound ,, to zoom and unzoom current window
- Removed space.vim, messing with semicolon mapping
- Make Cmd-Space work for completion always. Display tab numbers
- Readme for slime.vim
- Add slime.vim: Use ctrl-c ctrl-c to send text to irb in a screen session

Start a screen session using: screen -S sess pry
This creates a session named "sess" running pry
Now use ctrl-c, ctrl-c. First time you use it will ask
for the session name, give it 'sess'. Next time will
be automatic. The text will end up in your screen.
- Automatically write the file when we lose focus
- Vim-space for spacebar motion repeats, ruby block and indent block manipulation plugins
- Improving keybindings to not interfere with standard things
- Added zencoding plugin for html manipulation
- Keybindings ,rt for opening a Ruby Test (spec) in a split and ,n for NerdTree
- Fix neocompletion with ruby

## 2011-12-15

### Other

- Added pry! abbreviation for pry debugging line
- Mvim from MacVim build 63
- Ack, sudo plugins. Removed vim-ruby-debugger because it's not working cleanly

## 2011-12-13

### Other

- Improve status line colors (solarized)
- Improved method listing colors in pry
- Updated readme
- Reverted bad color choice
- Gundo config
- Improve some keymaps, instead of overriding standard keys.

Added many convenience mappings for LustyJuggler such as
,lm for rails models, ,lc for controllers, etc
- Added Gundo plugin
- Added lastpos, unimpaired, vim-git plugins
- Breaking vimrc apart into individual settings files in vim/plugin/settings

## 2011-12-11

### Other

- Updated README with latest keymap
- Better key mappings for gitgrep which don't override standard behavior

## 2011-12-09

### Other

- CommandT auto compiled on yadr init-plugins
- Updated subproject with file header
- Extracted vim-git-grep-rails-partial plugin

## 2011-12-08

### Other

- Added Command-T with ,t mapping (although I prefer PeepOpen)
- Removed bufexplorer, updated readme
- Replaced snippets with scrooloose-snippets
- Moved snipmate to submodule
- Fixing ref to fugitive
- Moved ruby_focused_unit_test, pathogen to bundles, removed ragtag
- Moved conqueterm into submodule
- Added yadr init-plugins command, and README
- Updated solarized scheme for better cursor color
- Improved readme
- Updated readme
- Updated bundles, use modern pathogen syntax in vimrc
- Adding 'yadr' command for managing plugins (wip)
- Deleted incorrectly cached module

## 2011-12-07

### Other

- Updated solarized submodule to latest
- Changed gitconfig to use vim again..vi reports errors on exit, causing problems
- Added Command-Space for completions
- Added neocomplcache plugin for automatic completion
- Dir structure cleanup
- Modularized endwise, indexed search, htmlescape
- Removed old plugins
- Modularized ruby-refactoring, matchit
- Change vim to vi so we don't have problems trying to load plugins
- Modularized vim-ruby
- Modularized rails.vim
- Repeat, surround, taglist; deleted unused plugins
- Gitgrep, lustyjuggler, greplace
- BufExplorer modularized
- Removed FindInNERDTree, now replaced with native function
- EasyMotion submodule
- Submoduled indexed search, syntastic
- Moved autotag to submodule
- Added nerdtree tabs plugin to make nerdtree play nice with macvim tabs
- Moved nerdtree to submodule
- Moved vim-markdown-preview to submodule
- Moved tComment to submodule
- Moved sparkup to submodule
- No need for irbrc; using pry
- Renamed module for standardization
- Installed latest showmarks plugin, forked solarized color scheme and improved on marks color
- Standardized naming of plugins in vim/bundle
- Killed fuzzy file finder
- Moved csapprox to submodule
- Moved vim-ruby-debugger into bundle/git submodule
- Removed docs and colors, do not want.
- Moved delimitMate to pathogen bundle and git submodule
- Renamed fugitive bundle to tpope-fugitive following github convention
- Removed unused CSApprox plugin
- Removed unused 0scan plugin
- Moved AnsiEsc into git submodule and pathogen bundle
- Removed all old bash cruft, supporting only zsh now. Improved README
- Broke out rspec/ruby conque integration into separate plugin: https://github.com/skwp/vim-ruby-conque

## 2011-12-06

### Other

- Added pryrc and awesome_print configuration, updated README
- Removed unused dir
- Added 'gcp' alias to comment current paragraph

Follows tComment's 'gcc' alias for comment current line.
- Color cleanup
- Removed old unused docs

## 2011-12-03

### Other

- Turn off case insensitive search, change easymotion to use only homerow keys and other nearby keys

## 2011-11-30

### Other

- Added html escaping script using C-h
- Apple-k, Apple-K for underscores and dashes
- Made yw behave like yaw, and changed EasyMotion to use only lower case keys to reduce dependence on shift
- Remap W to write the file, Cc to copy current command to the vim command line
- Added ctags files to global gitignore
- Added a few git aliases

## 2011-11-28

### Other

- Fix psg alias

## 2011-11-27

### Other

- Improved git log colors

## 2011-11-24

### Other

- Removed user info from gitconfig, use env variables
- Better git log command
- Fixed function/alias 'fn' for finding files
- Removed alias irb=>pry
- Added rvm

## 2011-11-23

### Other

- Improved default git logging to use tree graph mode
- Moved private info into env variables, cleanup
- Configuration for zsh

## 2011-11-22

### Other

- Cleanup paths, remove personal info
- Added willmorgan git helper scripts in bin/willmorgan
- Cleanup of gitconfig
- Clean up conflict of M window move with marks

(changed M to \m for show marks)

## 2011-11-21

### Other

- Aliases for git reset
- Fix window moving commands conflicting with M (show marks)

## 2011-11-18

### Other

- Fix submodule path
- Added vim-colors-solarized submodule
- Fix issue causing file not found, affecting gf (go to file) for rails
- Froze in latest git-completion.bash, fixed references in bash_profile to use ~/.dotfiles
- Updated readme for submodules
- Added vim-fugitive as a git submodule
- Trying to fix submodule situation
- Keybindings from ttscoff

## 2011-11-17

### Other

- Readme cleanup
- Updated readme
- Updated readme
- Initial commit.