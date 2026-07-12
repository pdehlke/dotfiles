if (( $+commands[carapace] )); then
  # zsh: fall back to zsh's own completion functions for commands carapace
  # doesn't know natively. bash: same, via bash-completion (installed).
  export CARAPACE_BRIDGES='zsh,bash'

  # git excluded: carapace ships a native git completer that would
  # compdef over zsh's stock _git, breaking 02_gitflow.zsh's _git-flow
  # integration and its 'user-commands flow:...' zstyle. Everything else
  # is fair game.
  export CARAPACE_EXCLUDES='git'

  # compinit already ran inside z4h init (see dot_zshrc.tmpl); do not
  # add another here (see docs/zsh-config-cleanup-2026-07.md).
  source <(carapace _carapace)
fi
