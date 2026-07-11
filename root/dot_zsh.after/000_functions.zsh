# Shell setup helpers and day-to-day utility functions.
#
#############################
# Color codes
# ###########################
RST=$'\033[0m'
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
ORANGE=$'\033[0;33m'
BLUE=$'\033[0;34m'
PURPLE=$'\033[0;35m'
CYAN=$'\033[0;36m'
LIGHTGRAY=$'\033[0;37m'
DARKGRAY=$'\033[1;30m'
LIGHTRED=$'\033[1;31m'
LIGHTGREEN=$'\033[1;32m'
YELLOW=$'\033[1;33m'
LIGHTBLUE=$'\033[1;34m'
LIGHTPURPLE=$'\033[1;35m'
LIGHTCYAN=$'\033[1;36m'
WHITE=$'\033[1;37m'

log() {
  local level msg highlight printcmd printflags emoji
  printcmd="${PRINTCMD:-echo}"
  printflags="${PRINTFLAGS:-"-e"}"
  level="${(U)1}"
  msg=("${@:2}")
  case "${level}" in
  INFO)
    highlight="${BLUE}"
    emoji="ℹ️  "
    ;;
  FATAL)
    highlight="${LIGHTRED}"
    emoji="💀 "
    ;;
  ERR*)
    highlight="${RED}"
    emoji="⛔️ "
    ;;
  WARN*)
    highlight="${ORANGE}"
    emoji="⚠️  "
    ;;
  DEBUG)
    if [[ "${VERBOSE}" != "true" ]]; then return; fi
    highlight=""
    emoji="🔎 "
    ;;
  *)
    highlight="${CYAN}"
    emoji=""
    ;;
  esac
  "${printcmd}" "${printflags}" "${highlight}*** ${emoji}${level}: ${msg[*]}${RST}" 1>&2
  if [[ "${level}" == "FATAL" ]]; then
    if [[ "${-}" =~ 'i' ]]; then return 1; else exit 1; fi
  fi
}

e2() {
  echo "$@" >&2
}

warn() {
  echo "$@" >&2
}

die() {
  warn "$@"
  if [[ "${-}" =~ 'i' ]]; then return 1; else exit 1; fi
}

quiet_which() {
  command -v "$1" >/dev/null
}

# Returns true (0) only if it is a directory and searchable.
test_directory() {
  [[ $# -eq 0 ]] && log ERR "Usage: test_directory dirname" && return 2
  [[ -d "$1" && -x "$1" ]]
}

# Canonicalize a directory name by dereferencing symlinks.
canonicalize_directory() {
  test_directory "$1" && (cd "$1" && builtin pwd -P)
}

# Check to see if a directory is already in a search path.
in_search_path() {
  [[ $# -lt 2 ]] && log ERR "Usage: in_search_path path dirname" && return 2
  local n="$1" d="$2"
  [[ ":${(P)n}:" == *":$d:"* ]]
}

# Sanity-check then append a directory to a search path.
dirapp() {
  [[ $# -lt 2 ]] && log ERR "Usage: dirapp varname dirname" && return 2
  local n="$1" d
  d=$(canonicalize_directory "$2") || return 1
  in_search_path "$n" "$d" && return 1
  if [[ -n "${(P)n}" ]]; then
    typeset -g "$n=${(P)n}:$d"
  else
    typeset -g "$n=$d"
  fi
}

#############################
# Day-to-day utility functions
#############################

function copy() {
    if (( $# != 1))
    then echo "usage: copy <filename>"; return 1
    fi
    pbcopy < "$1"
}

# NOTE: cd() is defined in zoxide.zsh (must come after zoxide init): it
# handles cd-to-parent-when-given-a-file and falls through to zoxide.

function tmux() {
    emulate -L zsh

    # If provided with args, pass them through.
    if [[ -n "$@" ]]; then
        command tmux "$@"
        return
    fi

    # Attach to existing session, or create one, based on current directory.
    local SESSION_NAME
    SESSION_NAME=$(basename "$(pwd)")
    command tmux new -A -s "$SESSION_NAME"
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
    tmp=$(openssl s_client -connect "${domain}:443" -servername "${domain}" </dev/null 2>&1)

    if [[ "${tmp}" =~ "-----BEGIN CERTIFICATE-----" ]]; then
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

# Use Git’s colored diff when available. The `function` keyword is required:
# z4h aliases diff, and zsh refuses to parse `diff() {...}` over a live alias.
if hash git &>/dev/null; then
    (( ${+aliases[diff]} )) && unalias diff
    function diff() {
        git diff --no-index --color-words "$@"
    }
fi

# Run `dig` and display the most useful info
digga() {
    if [[ $# -eq 2 ]]; then
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
    if ! git rev-parse --is-inside-work-tree &>/dev/null; then
        echo "Not a git repo!"
        return 1
    fi

    # Find current directory relative to .git parent
    local full_path git_base_path relative_path
    full_path=$(pwd)
    git_base_path=$(git rev-parse --show-toplevel)
    relative_path=${full_path#$git_base_path} # remove leading git_base_path from working directory

    # If filename argument is present, append it
    if [[ -n "$1" ]]; then
        relative_path="$relative_path/$1"
    fi

    # Figure out current git branch
    local git_where branch tree url
    git_where=$(command git name-rev --name-only --no-undefined --always HEAD 2>/dev/null)

    # Remove cruft from branchname
    branch=${git_where#refs\/heads\/}
    branch=${branch#remotes\/origin\/}

    [[ $base_url == *bitbucket* ]] && tree="src" || tree="tree"
    url="$base_url/$tree/$branch$relative_path"

    echo "Calling $(type open) for $url"

    open "$url" &>/dev/null || { echo "Using $(type open) to open URL failed."; return 1 }
}

lg() {
    local -x LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [[ -f "$LAZYGIT_NEW_DIR_FILE" ]]; then
        cd "$(cat "$LAZYGIT_NEW_DIR_FILE")"
        rm -f "$LAZYGIT_NEW_DIR_FILE" >/dev/null
    fi
}

listening() {
    if [[ $# -eq 0 ]]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [[ $# -eq 1 ]]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color "$1"
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
    if [[ "$#" -eq 2 ]]; then
        export AWS_PROFILE="$1"
        export AWS_DEFAULT_REGION="$2"
        showAWSAccount
    elif [[ "$#" -eq 0 ]]; then
        showAWSAccount
    else
        log ERR "Usage: awsAccount profile region" && return 2
    fi
}

showAWSAccount() {
    [[ ! -v AWS_PROFILE ]] && echo "No account set" || echo "Account: $AWS_PROFILE"
    [[ ! -v AWS_DEFAULT_REGION ]] && echo "No region set" || echo "Region: $AWS_DEFAULT_REGION"
}

# Control-X F to fuzzy find a directory with peco & insert it at the current command line position

function peco-directories() {
  local current_lbuffer="$LBUFFER"
  local current_rbuffer="$RBUFFER"
  local dir
  if command -v fd >/dev/null 2>&1; then
    dir="$(command fd --type directory --hidden --no-ignore --exclude .git/ --color never 2>/dev/null | peco )"
  else
    dir="$(
      command find \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -prune -o -type d -print 2>/dev/null \
      | sed 1d \
      | cut -b3- \
      | awk '{ print length($0), $0 }' \
      | sort -n -s \
      | cut -d' ' -f2- \
      | peco
    )"
  fi

  if [[ -n "$dir" ]]; then
    dir=$(echo "$dir" | tr -d '\n')
    dir=$(printf %q "$dir")

    BUFFER="${current_lbuffer}${dir}${current_rbuffer}"
    CURSOR=$#BUFFER
  fi
}

function peco-files() {
  local current_lbuffer="$LBUFFER"
  local current_rbuffer="$RBUFFER"
  local file
  if command -v fd >/dev/null 2>&1; then
    file="$(command fd --type file --hidden --no-ignore --exclude .git/ --color never 2>/dev/null | peco)"
  elif command -v rg >/dev/null 2>&1; then
    file="$(rg --glob "" --files --hidden --no-ignore-vcs --iglob !.git/ --color never 2>/dev/null | peco)"
  elif command -v ag >/dev/null 2>&1; then
    file="$(ag --files-with-matches --unrestricted --skip-vcs-ignores --ignore .git/ --nocolor -g "" 2>/dev/null | peco)"
  else
    file="$(
    command find \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -prune -o -type f -print 2> /dev/null \
      | sed 1d \
      | cut -b3- \
      | awk '{ print length($0), $0 }' \
      | sort -n -s \
      | cut -d' ' -f2- \
      | peco
    )"
  fi

  if [[ -n "$file" ]]; then
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

# NOTE: recent/frecent directory jumping is owned by zoxide (see zoxide.zsh:
# `z`/`zi`), not by zsh's built-in cdr/chpwd_recent_dirs. Don't reintroduce
# that mechanism here; it duplicates zoxide's job.

# get ghq and peco help us find our git repos
gcd() {
  [[ "$#" -ne 1 ]] && log ERR "Usage: gcd <string>" && return 2
  cd "$(ghq list -p | perl -nlpe 's[.*src/(.*)][$1\0$_]' | peco --null --query "$1")"
}

flap () {
    cd "${1:-.}"
    local result
    result="$(fzf --preview="bat --color=always {} | head -$LINES")"
    if [[ -n "$result" ]]; then
        bat "$result"
    fi
    cd - > /dev/null
}

# Use a combination of direnv, uv, and mise-en-place to manage python
# environments. This function relies on the mise and uv functions defined
# in ${HOME}/.config/direnv/lib/layout_uv.sh and ${HOME}/.config/direnv/lib/use_mise.sh

uv-create() {
	local flag_help
	local arg_python=(3.14.3) # set a default
	local arg_type=(default)  # the default uv project_type
	local usage=(
		"uv-create [-h|--help]"
		"uv-create [-p|--python=<python_version>] [-t|--type=<project_type (default|app|package|lib)>]"
	)

	# -D pulls parsed flags out of $@
	# -E allows flags/args and positionals to be mixed, which we don't want in this example
	# -F says fail if we find a flag that wasn't defined
	# -M allows us to map option aliases (ie: h=flag_help -help=h)
	# -K allows us to set default values without zparseopts overwriting them
	# Remember that the first dash is automatically handled, so long options are -opt, not --opt
	zmodload zsh/zutil
	zparseopts -D -F -K -- \
		{h,-help}=flag_help \
		{p,-python}:=arg_python \
		{t,-type}:=arg_type ||
		return 1

	[[ -z "$flag_help" ]] || { print -l $usage && return; }

	if ! [[ "$arg_type[-1]" =~ ^(default|app|package|lib)$ ]]; then
		print -l $usage && return 1
	fi

	if [[ -f .tool-versions || -f .envrc || -d .venv ]]; then
		log FATAL ".tool-versions or .envrc or .venv already exists. Not clobbering." || return 1
	fi

	for i in uv direnv mise; do
		command -v $i >/dev/null 2>&1 || log FATAL "$i not found in your PATH" || return 1
	done

	cat >.tool-versions <<EOF
	uv latest
	python $arg_python[-1]
EOF

	case "$arg_type[-1]" in
	default)
		cat >.envrc <<EOF
	use mise
	layout uv
EOF
		;;
	*)
		cat >.envrc <<EOF
	use mise
	layout uv-$arg_type[-1]
EOF
		;;
	esac

}
