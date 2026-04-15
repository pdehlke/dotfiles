
if (( $+commands[grc] )); then
   (( ${+aliases[grc]} )) && unalias grc
fi

(( ${+aliases[du]} )) && unalias du
(( ${+aliases[ls]} )) && unalias ls

alias path='echo $PATH | tr : "\n"'

quiet_which() {
  command -v "\$1" >/dev/null
}

# alias listening="sudo lsof -iTCP -sTCP:LISTEN -n -P"

alias du='${HOMEBREW_PREFIX}/bin/gdu -h -t 2'
#alias ls='/bin/ls -FGh -C'
alias ls='/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AF --color=auto'
alias t='todo.sh'
alias cat=bat
#alias cat="bat --theme=$(defaults read -globalDomain AppleInterfaceStyle &>/dev/null && echo DarkNeon || echo GitHub)"
alias pfm=npm
alias history='history -i'

v() {
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && $EDITOR "${file}" || return 1
}

# cd into the directory containing a recently used file
vd() {
    local dir
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && dir=$(dirname "$file") && cd "$dir"
}

# cd into recent directories
zd() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

alias j=zd

#alias v='f -e vim'
alias ts='tmux new-session -s'
alias ave='aws-vault exec --duration=12h'
alias avc='aws-vault clear'
alias avl='aws-vault list'

alias ssh_rosetta='aws ecs execute-command --cluster rosetta --command "/bin/bash" --interactive --container rosetta --region us-east-1 --task $(aws ecs list-tasks --cluster rosetta --output text |  cut -d "/" -f 3 | head -1)'
alias ssh_rosetta_splunk='aws ecs execute-command --cluster rosetta --command "/bin/bash" --interactive --container splunk --region us-east-1 --task $(aws ecs list-tasks --cluster rosetta --output text |  cut -d "/" -f 3 | head -1)'
alias new_rosetta='aws ecs stop-task --cluster rosetta --task $(aws ecs list-tasks --cluster rosetta --output text |  cut -d "/" -f 3 | head -1)'

alias current_tomcat='instances tomcat  | grep running | awk "{print \$2}" | uniq | xargs aws ec2 describe-images --image-ids | jq -r ".Images[].Name" | rev | cut -c 9- | rev'
[ -e "$HOMEBREW_PREFIX/etc/grc.zsh" ] && source "$HOMEBREW_PREFIX/etc/grc.zsh"
#alias weather='curl  "wttr.in?format=2"'
alias weather='http --body "wttr.in?format=2"'
alias cb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'
alias cqlsh='PYENV_VERSION=2.7.18 /opt/abvprp/apache-cassandra/bin/cqlsh --ssl'

# Taskwarrior aliases
alias in="task add +in"
alias inbox="task in"
alias next="task next"
