# DO NOT SET JAVA_HOME. mise manages java versions.

# Go-stdlib-only tools (e.g. carapace) fall back to
# ~/Library/Application Support on macOS unless this is set; every other
# tool in this repo already lives under ~/.config by chezmoi convention
# (they hardcode it, not via this var), so this just brings XDG-only tools
# into line. See docs/dotfiles-enhancements.md carapace section.
export XDG_CONFIG_HOME="$HOME/.config"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export BAT_THEME="Solarized (dark)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bg=cyan,underline"

# Point SSH_AUTH_SOCK at the 1Password SSH agent so tools that talk to the
# agent directly (ssh-add, git commit signing, etc.) reach it. `ssh` itself
# ignores this because ~/.ssh/config sets IdentityAgent, but other tools
# only look at SSH_AUTH_SOCK.
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Our private dotfiles repo
export yprivate=$HOME/.yadr-private/root
