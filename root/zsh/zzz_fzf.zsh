### FZF fuzzy finder
# fzf/install --no-fish --no-update-rc --completion --xdg
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && \
  source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# custom fzf helpers
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.sh ] && \
  source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.sh

