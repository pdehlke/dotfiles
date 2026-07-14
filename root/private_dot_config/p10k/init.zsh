# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$XDG_CONFIG_HOME/p10k/p10k.zsh"
source "$XDG_CONFIG_HOME/p10k/powerlevel2k.zsh"
source "$XDG_CONFIG_HOME/p10k/p10k.mise.zsh"

