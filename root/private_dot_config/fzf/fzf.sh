# ------------------------------------------------------------------------
# FZF options

export FZF_CTRL_R_OPTS="--preview 'echo {}' \
  --preview-window down:3:wrap \
  --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND="command find -L . -mindepth 1 \
\\( \
  -fstype 'sysfs' \
  -o -fstype 'devfs' \
  -o -fstype 'devtmpfs' \
  -o -fstype 'proc' \
\\) -prune -o \
\\( \
  -path '*/\\.git' \
  -o -path '*/node_modules' \
  -o -path '*/target' \
  -o -path '*/dist' \
\\) -prune -o \
-type d -print 2> /dev/null | cut -b3-"
export FZF_CTRL_T_COMMAND="command find -L . -mindepth 1 \
\\( \
  -fstype 'sysfs' \
  -o -fstype 'devfs' \
  -o -fstype 'devtmpfs' \
  -o -fstype 'proc' \
\\) \
-prune -o \
\\( \
  -path '*/\\.git/*/*' \
  -o -path '*/node_modules' \
  -o -path '*/target' \
  -o -path '*/dist' \
\\) \
-prune -o \
\\( \
  -type f \
  -o -type d \
  -o -type l \
\\) \
-print 2> /dev/null | cut -b3-"



# ------------------------------------------------------------------------
# tmux

# tmuxp profiles
ftmux() {
  local tprofiles

  tprofiles=( $(find ${XDG_CONFIG_HOME:-$HOME/.config}/tmuxp -type f \
    -printf "%P\n" | cut -d\. -f1 | fzf --multi --query="$1") )
  if [ -z "$tprofiles" ]; then
    tmux ls
    tmuxp ls
  else
    tmuxp load "${tprofiles[@]}"
  fi
}

# ftpane - switch pane (@george-b)
ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse)

  if [ -n "$target" ]; then
    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane} && exit
    else
      tmux select-pane -t ${target_window}.${target_pane} &&
        tmux select-window -t $target_window && exit
    fi
  fi

}


# ------------------------------------------------------------------------
# fasd

av() {
  [ $# -gt 0 ] && fasd -f -e ${EDITOR} "$*" && return
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

if type z >/dev/null 2>&1; then
  unalias z
fi
z() {
  if [[ -z "$*" ]]; then
    cd "$(fasd_cd -d | fzf -1 -0 --no-sort --tac +m | sed 's/^[0-9,.]* *//')"
  else
    cd "$(fasd_cd -d | fzf --query="$*" -1 -0 --no-sort --tac +m | sed 's/^[0-9,.]* *//')"
  fi
}


# ------------------------------------------------------------------------
# process

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf --height=40% -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf --height=40% -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# vim: ft=sh
