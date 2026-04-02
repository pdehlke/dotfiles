function copy() { 
    if (( $# != 1))
    then echo "usage: copy <filename>"; return 1
    fi
    cat $1 | pbcopy
}

# This is kind of cool. Lets me cd to the parent directory of a file if
# I happen to call cd with a filename as an argument. This happens a lot
# when I do things like vi /foo/bar/baz; cd !$
# Yes, this fails on symlinks to files. Sue me.

function cd() {
    if [ -z "$1" ]; then
        builtin cd
    else
        if [ -n "$2" ]; then
            local TRY="${PWD/$1/$2}"
        else
            local TRY="$1"
        fi

        if [ -f "${TRY}" ]; then
            builtin cd $(dirname "${TRY}")
        else
            builtin cd "${TRY}"
        fi
    fi
}

function tmux() {
    emulate -L zsh

    # Make sure even pre-existing tmux sessions use the latest SSH_AUTH_SOCK.
    # (Inspired by: https://gist.github.com/lann/6771001)
    local SOCK_SYMLINK=~/.ssh/ssh_auth_sock
    if [ -r "$SSH_AUTH_SOCK" -a ! -L "$SSH_AUTH_SOCK" ]; then
        ln -sf "$SSH_AUTH_SOCK" $SOCK_SYMLINK
    fi

    # If provided with args, pass them through.
    if [[ -n "$@" ]]; then
        env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux "$@"
        return
    fi

    # Attach to existing session, or create one, based on current directory.
    SESSION_NAME=$(basename "$(pwd)")
    env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux new -A -s "$SESSION_NAME"
}

# Simple calculator
function calc() {
    local result=""
    result="$(printf "scale=10;%s\\n" "$*" | bc --mathlib | tr -d '\\\n')"
    #                       └─ default (when `--mathlib` is used) is 20

    if [[ "$result" == *.* ]]; then
        # improve the output for decimal numbers
        # add "0" for cases like ".5"
        # add "0" for cases like "-.5"
        # remove trailing zeros
        printf "%s" "$result" |
            sed -e 's/^\./0./' \
                -e 's/^-\./-0./' \
                -e 's/0*$//;s/\.$//'
    else
        printf "%s" "$result"
    fi
    printf "\\n"
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain

function getcertnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified."
        return 1
    fi

    local domain="${1}"
    echo "Testing ${domain}…"
    echo ""

    local tmp
    tmp=$(echo -e "GET / HTTP/1.0\\nEOT" |
        openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1)

    if [[ "${tmp}" =~ "---BEGIN CERTIFICATE---" ]]; then
        local certText
        certText=$(echo "${tmp}" |
            openssl x509 -text -certopt "no_header, no_serial, no_version, \
            no_signame, no_validity, no_issuer, no_pubkey, no_sigdump, no_aux")
        echo "Common Name:"
        echo ""
        echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//"
        echo ""
        echo "Subject Alternative Name(s):"
        echo ""
        echo "${certText}" | grep -A 1 "Subject Alternative Name:" |
            sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\\n" | tail -n +2
        return 0
    else
        echo "ERROR: Certificate not found."
        return 1
    fi
}

# Use Git’s colored diff when available
if hash git &>/dev/null; then
    diff() {
        git diff --no-index --color-words "$@"
    }
fi

# Run `dig` and display the most useful info
digga() {
    if [ $# -eq 2 ]; then
        dig +nocmd "$1" +multiline +noall +answer "$2"
    else
        dig +nocmd "$1" +multiline +noall +answer a
    fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
    tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# Call from a local repo to open the repository on github/bitbucket in browser
# Modified version of https://github.com/zeke/ghwd
repo() {
    # Figure out github repo base URL
    local base_url
    base_url=$(git config --get remote.origin.url)
    base_url=${base_url%\.git} # remove .git from end of string

    # Fix git@github.com: URLs
    base_url=${base_url//git@github\.com:/https:\/\/github\.com\/}

    # Fix git://github.com URLS
    base_url=${base_url//git:\/\/github\.com/https:\/\/github\.com\/}

    # Fix git@bitbucket.org: URLs
    base_url=${base_url//git@bitbucket.org:/https:\/\/bitbucket\.org\/}

    # Fix git@gitlab.com: URLs
    base_url=${base_url//git@gitlab\.com:/https:\/\/gitlab\.com\/}

    # Validate that this folder is a git folder
    if ! git branch 2>/dev/null 1>&2; then
        echo "Not a git repo!"
        exit $?
    fi

    # Find current directory relative to .git parent
    full_path=$(pwd)
    git_base_path=$(
        cd "./$(git rev-parse --show-cdup)" || exit 1
        pwd
    )
    relative_path=${full_path#$git_base_path} # remove leading git_base_path from working directory

    # If filename argument is present, append it
    if [ "$1" ]; then
        relative_path="$relative_path/$1"
    fi

    # Figure out current git branch
    # git_where=$(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
    git_where=$(command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null

    # Remove cruft from branchname
    branch=${git_where#refs\/heads\/}
    branch=${branch#remotes\/origin\/}

    [[ $base_url == *bitbucket* ]] && tree="src" || tree="tree"
    url="$base_url/$tree/$branch$relative_path"

    echo "Calling $(type open) for $url"

    open "$url" &>/dev/null || (echo "Using $(type open) to open URL failed." && exit 1)
}

lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
    fi
}

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# Make a directory and cd into it
mkcd () {
mkdir -p "$*"
cd "$*"
}

# set aws account and region
awsAccount () {
    if [ "$#" -eq 2 ]; then
        export AWS_DEFAULT_PROFILE="$1"
        export AWS_PROFILE="$1"
        export AWS_DEFAULT_REGION="$2"
        showAWSAccount
    elif [[ "$#" -eq 0 ]]; then
        showAWSAccount
    else
        e2 "Usage: awsAccount profile region" && return 2
    fi
}

showAWSAccount() {
    [[ ! -v AWS_DEFAULT_PROFILE ]] && echo "No account set" || echo "Account: $AWS_DEFAULT_PROFILE"
    [[ ! -v AWS_DEFAULT_REGION ]] && echo "No region set" || echo "Region: $AWS_DEFAULT_REGION"
}

# Control-X F to fuzzy find a directory with peco & insert it at the current command line position

function peco-directories() {
  local current_lbuffer="$LBUFFER"
  local current_rbuffer="$RBUFFER"
  if command -v fd >/dev/null 2>&1; then
    local dir="$(command fd --type directory --hidden --no-ignore --exclude .git/ --color never 2>/dev/null | peco )"
  else
    local dir="$(
      command find \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -type d -print 2>/dev/null \
      | sed 1d \
      | cut -b3- \
      | awk '{a[length($0)" "NR]=$0}END{PROCINFO["sorted_in"]="@ind_num_asc"; for(i in a) print a[i]}' - \
      | peco
    )"
  fi

  if [ -n "$dir" ]; then
    dir=$(echo "$dir" | tr -d '\n')
    dir=$(printf %q "$dir")

    BUFFER="${current_lbuffer}${file}${current_rbuffer}"
    CURSOR=$#BUFFER
  fi
}

function peco-files() {
  local current_lbuffer="$LBUFFER"
  local current_rbuffer="$RBUFFER"
  if command -v fd >/dev/null 2>&1; then
    local file="$(command fd --type file --hidden --no-ignore --exclude .git/ --color never 2>/dev/null | peco)"
  elif command -v rg >/dev/null 2>&1; then
    local file="$(rg --glob "" --files --hidden --no-ignore-vcs --iglob !.git/ --color never 2>/dev/null | peco)"
  elif command -v ag >/dev/null 2>&1; then
    local file="$(ag --files-with-matches --unrestricted --skip-vcs-ignores --ignore .git/ --nocolor -g "" 2>/dev/null | peco)"
  else
    local file="$(
    command find \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -type f -print 2> /dev/null \
      | sed 1d \
      | cut -b3- \
      | awk '{a[length($0)" "NR]=$0}END{PROCINFO["sorted_in"]="@ind_num_asc"; for(i in a) print a[i]}' - \
      | peco
    )"
  fi

  if [ -n "$file" ]; then
    file=$(echo "$file" | tr -d '\n')
    file=$(printf %q "$file")
    BUFFER="${current_lbuffer}${file}${current_rbuffer}"
    CURSOR=$#BUFFER
  fi
}

zle -N peco-directories
bindkey '^Xf' peco-directories
zle -N peco-files
bindkey '^X^f' peco-files

# Control-X R to use peco in a popd-like fashion

if [[ -z "$ZSH_CDR_DIR" ]]; then
  ZSH_CDR_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/cdr"
fi
mkdir -p "$ZSH_CDR_DIR"

autoload -Uz chpwd_recent_dirs cdr
autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file "$ZSH_CDR_DIR"/recent-dirs
zstyle ':chpwd:*' recent-dirs-max 1000
# fall through to cd
zstyle ':chpwd:*' recent-dirs-default yes

peco-cdr () {
    local current_lbuffer="$LBUFFER"
    local current_rbuffer="$RBUFFER"
    local selected=$(cdr -l | peco --prompt 'cdr >')
    if [ -n "$selected" ]; then
      tokens=("${(z)selected}")
      dir=${tokens[2]}
      BUFFER="${current_lbuffer}${dir}${current_rbuffer}"
      CURSOR=$#BUFFER
    fi
}

# get ghq and peco help us find our git repos
gcd() {
  test "$#" -ne 1 && e2 "Usage: gcd <string>" && return 2
  cd "$(ghq list -p | perl -nlpe 's[.*src/(.*)][$1\0$_]' | peco --null --query $1)"
}

flap ()
{
    cd ${1:-.};
    local result;
    result="$(fzf --preview="bat --color=always {} | head -$LINES")";
    if [[ -n "$result" ]]; then
        bat "$result";
    fi;
    cd - > /dev/null
}
