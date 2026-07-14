if (( $+commands[fzf] )); then
  # Catppuccin Mocha palette (https://github.com/catppuccin/fzf) mapped onto
  # fzf's --color keys. See docs/zsh-config-cleanup-2026-07.md ("2026-07-11:
  # fzf reclaims ^R from peco") for how the key set itself was chosen.
  #
  # Keys limited to what fzf 0.25.1 accepts (no `label`/`selected-bg`,
  # added in later releases): z4h's own completion widget shells out to
  # its bundled ~/.cache/zsh4humans/v5/fzf/bin/fzf, not the newer fzf on
  # $PATH, and rejects unknown --color keys by exiting with an error --
  # which z4h's widget swallows silently, breaking Tab completion outright.
  export FZF_DEFAULT_OPTS="--color=fg:#CDD6F4,bg:#1E1E2E,hl:#F38BA8,fg+:#CDD6F4,bg+:#313244,hl+:#F38BA8,info:#CBA6F7,prompt:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,spinner:#F5E0DC,header:#F38BA8,border:#6C7086"

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
