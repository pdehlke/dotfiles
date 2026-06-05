### FZF fuzzy finder
# fzf/install --xdg --all --no-update-rc \
#   --no-fish --no-bash
# Solarized dark colors
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] &&
  source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# custom fzf helpers
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.sh ] &&
  source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.sh
