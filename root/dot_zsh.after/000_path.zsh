PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

if quiet_which brew; then
  eval $(brew shellenv)

  export HOMEBREW_AUTO_UPDATE_SECS=3600
  export HOMEBREW_DEVELOPER=1
  export HOMEBREW_UPDATE_REPORT_ONLY_INSTALLED=1
  export HOMEBREW_GIT_FILTER_TREE_ZERO=1
  export HOMEBREW_BOOTSNAP=1

  alias hbc='cd $HOMEBREW_REPOSITORY/Library/Taps/homebrew/homebrew-core'
fi

dirapp PATH ${HOME}/bin
# Prefer gnu versions of common utils, to mitigate portability problems
# when writing scripts for linux environments
PATH=${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${PATH}
