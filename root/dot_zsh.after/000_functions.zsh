# functions we need to set up everything.
# Day-to-day utility functions are in
# ${HOME}/.zsh.after/functions.zsh
#
#############################
# Color codes
# ###########################
RST='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

log() {
  local level msg highlight printcmd printflags emoji
  printcmd="${PRINTCMD:-echo}"
  printflags="${PRINTFLAGS:-"-e"}"
  level="$(tr '[:lower:]' '[:upper:]' <<<"${@:1:1}")"
  msg=("${@:2}")
  case "${level}" in
  INFO)
    highlight="${BLUE}"
    emoji="ℹ️  "
    ;;
  FATAL)
    highlight="${LIGHTRED}"
    emoji="💀 "
    exit 1
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
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

quiet_which() {
  command -v "$1" >/dev/null
}

# this is a little better than which or command
findinpath() {
  test "$#" -lt 1 && warn "Usage: findinpath exe_basename [path]" && return 2
  local f="$1"
  local IFS=":$IFS"
  set -- ${2:-$PATH}
  while test "$#" -gt 0; do
    test -x "$1/$f" && echo "$1/$f" && return 0
    shift
  done
  return 1
}

# Returns true (0) only if it is a directory and searchable.
test_directory() {
  test "$#" -eq 0 && e2 "Usage: test_directory dirname" && return 2
  test -d "$1" && test -x "$1"
}

# Canonicalize a directory name by dereferencing symlinks.
canonicalize_directory() {
  test_directory "$1" && echo $(
    cd "$1"
    /bin/pwd
  )
}

# Check to see if a directory is already in a search path.
in_search_path() {
  test "$#" -lt 2 && e2 "Usage: in_search_path path dirname" && return 2
  local n="$1"
  local d="$2"
  eval 'case $'$n' in *:'$d':*) return 0; esac'
  return 1
}

# Sanity-check then append a directory to a search path.
dirapp() {
  test "$#" -lt 2 && e2 "Usage: dirapp varname dirname" && return 2
  local n="$1"
  local d="$2"
  d=$(canonicalize_directory "$d") || return 1
  eval in_search_path \"\$$n\" $d && return 1
  if eval test -n \"\$$n\"; then
    eval $n=\"\$$n:$d\"
  else
    eval $n=\"$d\"
  fi
}

# Sanity-check then prepend a directory to a search path.
# TODO: Allow caller to "move" directory to front with this funcall.
dirpre() {
  test "$#" -lt 2 && e2 "Usage: dirpre varname dirname" && return 2
  local n="$1"
  local d="$2"
  d=$(canonicalize_directory "$d") || return 2
  #    eval in_search_path \"\$$n\" $d && return 1
  if eval test -n \"\$$n\"; then
    eval $n=\"$d:\$$n\"
  else
    eval $n=\"$d\"
  fi
}

# Call dirapp for a list of directories.
dirapplist() {
  test "$#" -lt 2 && e2 "Usage: dirapplist varname d1 d2 ..." && return 2
  local n="$1"
  shift
  while test "$#" -gt 0; do
    dirapp "$n" "$1"
    shift
  done
}

# Call dirpre for a list of directories.
# NOTE: Directories will appear in reverse order in varname.
dirprelist() {
  test "$#" -lt 2 && e2 "Usage: dirapplist varname d1 d2 ..." && return 2
  local n="$1"
  shift
  while test "$#" -gt 0; do
    dirpre "$n" "$1"
    shift
  done
}
