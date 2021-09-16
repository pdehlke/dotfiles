# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Tell `p10k configure` which file it should overwrite.
# To customize prompt, run `p10k configure` or edit $POWERLEVEL9K_CONFIG_FILE.
POWERLEVEL9K_CONFIG_FILE=~/.p10k.zsh
[[ ! -f "${POWERLEVEL9K_CONFIG_FILE}" ]] || source "${POWERLEVEL9K_CONFIG_FILE}"

