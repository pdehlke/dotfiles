if (( $+commands[carapace] )); then
  # zsh: fall back to zsh's own completion functions for commands carapace
  # doesn't know natively. bash: same, via bash-completion (installed).
  export CARAPACE_BRIDGES='zsh,bash'

  # git excluded: carapace ships a native git completer that would
  # compdef over zsh's stock _git, breaking 02_gitflow.zsh's _git-flow
  # integration and its 'user-commands flow:...' zstyle.
  #
  # docker excluded: carapace's bundled docker completer (73 subcommands)
  # lags Homebrew's generated _docker (85, includes compose/buildx/scout/
  # mcp/model/etc.). Falling back to zsh's stock _docker keeps completion
  # current with whatever docker CLI is actually installed.
  #
  # Everything else is fair game.
  export CARAPACE_EXCLUDES='git,docker'

  # compinit already ran inside z4h init (see dot_zshrc.tmpl); do not
  # add another here (see docs/zsh-config-cleanup-2026-07.md).
  #
  # carapace writes its own `list-colors` zstyle for every completed
  # command's curcontext, in zsh's rich match-highlight syntax (multiple
  # `=`-separated fields per entry). z4h's own fzf-popup colorizer
  # (-z4h-set-list-colors, in $Z4H/zsh4humans/fn/) only understands simple
  # GNU dircolors "code=value" pairs and crashes ("bad set of key/value
  # pairs for associative array") when it reads carapace's value back.
  # Strip that one zstyle call from carapace's generated script before
  # sourcing it; z4h's own LS_COLORS-derived list-colors zstyle (set once
  # in -z4h-compinit) still applies, so completions stay colored -- just
  # without carapace's own per-match highlighting.
  source <(carapace _carapace | sed '/list-colors "${zstyle}"/d')
fi
