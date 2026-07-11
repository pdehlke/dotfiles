if (( $+commands[fzf] )); then
  # Solarized Dark palette mapped onto fzf's --color keys. See
  # docs/zsh-config-cleanup-2026-07.md ("2026-07-11: fzf reclaims ^R from
  # peco") for how these keys were chosen.
  export FZF_DEFAULT_OPTS="--color=fg:#839496,bg:#002b36,hl:#268bd2,fg+:#93a1a1,bg+:#073642,hl+:#cb4b16,info:#586e75,prompt:#268bd2,pointer:#2aa198,marker:#859900,spinner:#b58900,header:#586e75,border:#586e75"

  # fzf's own CTRL-T (file picker), CTRL-R (history search), and ALT-C
  # (fuzzy cd) widgets. Deliberately source only key-bindings.zsh, NOT
  # completion.zsh: z4h owns TAB completion via its `:z4h:fzf-complete`
  # zstyle (see dot_zshrc.tmpl), and loading fzf's own completion.zsh on
  # top of it would duplicate that mechanism -- the same class of problem
  # (duplicate compinit, duplicate zsh-autosuggestions) the 2026-07 cleanup
  # fixed elsewhere.
  #
  # This claims ^R back from peco (see the now-deleted
  # 10_peco_shell_history.zsh); peco keeps ^Xf/^X^f/gcd/cb unchanged.
  if [[ -n "$HOMEBREW_PREFIX" && -r "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
    source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
  fi
fi
