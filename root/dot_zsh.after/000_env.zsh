export AWS_SESSION_TOKEN_TTL=8h
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future
export TODOTXT_DEFAULT_ACTION=ls

# DO NOT SET JAVA_HOME. jenv will manage that for you.
# See the comments in 01_version_managers.zsh
# export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_AUTO_UPDATE=1
#export HOMEBREW_AUTO_UPDATE_SECS=604800
export HOMEBREW_NO_ANALYTICS=1
export BAT_THEME="Solarized (dark)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bg=cyan,underline"
