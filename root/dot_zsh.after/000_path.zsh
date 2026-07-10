# z4h already put homebrew on PATH and exported HOMEBREW_PREFIX; shellenv
# fills in the rest (MANPATH, INFOPATH) and is idempotent.
if quiet_which brew; then
  eval $(brew shellenv)

  export HOMEBREW_DEVELOPER=1
  export HOMEBREW_UPDATE_REPORT_ONLY_INSTALLED=1
  export HOMEBREW_GIT_FILTER_TREE_ZERO=1
  export HOMEBREW_BOOTSNAP=1

  alias hbc='cd $HOMEBREW_REPOSITORY/Library/Taps/homebrew/homebrew-core'
fi

# Prefer gnu versions of common utils, to mitigate portability problems
# when writing scripts for linux environments
PATH=${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${PATH}
