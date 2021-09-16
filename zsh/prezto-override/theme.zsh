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

### Overwrite Powerlevel10k options

POWERLEVEL9K_TRANSIENT_PROMPT=same-dir # Options: off, always, same-dir
# POWERLEVEL9K_INSTANT_PROMPT=quiet    # Options: off, quiet, verbose

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir                     # current directory
    vcs                     # git status
    # =========================[ Line #2 ]=========================
    newline                 # \n
    prompt_char             # prompt symbol
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    direnv                  # direnv status (https://direnv.net/)
    asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
    context                 # user@hostname
    vim_shell               # vim shell indicator (:sh)
    time                    # current time
    # =========================[ Line #2 ]=========================
    newline                 # \n
)

# Disable dir/git icons
# POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_VCS_BRANCH_ICON=''

# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle" # use default strategy truncate_to_unique
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT='%D{%Y-%m-%d %H:%M:%S}' # Shows date and time

# Uncomment to enable sparse mode (newline before prompt)
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

