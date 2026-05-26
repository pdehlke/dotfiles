# Aliases in this file are bash and zsh compatible

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# PS
alias psa='ps aux'
alias psg='ps aux | grep '
alias psr='ps aux | grep ruby'

# Kill
alias ka9='killall -9'
alias k9='kill -9'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# common pipelines
alias -g C='| wc -l'
alias -g H='| head'
alias -g L='| less'
alias -g N='| /dev/null'
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  # shellcheck disable=SC2154
  source "$yadr/aliases.sh"
}

alias ae='vim $yadr/aliases.sh'    # alias edit
alias ar='source $yadr/aliases.sh' # alias reload
alias gar='killall -HUP -u "$USER" zsh' # global alias reload

# chezmoi aliases
alias czI='chezmoi init' # chezmoi [I]nit
alias czh='chezmoi cd' # chezmoi [h]ome
alias cza='chezmoi apply --no-pager' # chezmoi [a]pply
alias czA='chezmoi add' # chezmoi [A]dd
alias czc='chezmoi cat' # chezmoi [c]at
alias cze='chezmoi edit --apply --no-pager' # chezmoi [e]dit
alias czC='chezmoi cat-config' # chezmoi [C]at-config
alias czE='chezmoi edit-config' # chezmoi [E]dit-config
alias czf='chezmoi forget' # chezmoi [f]orget
alias czg='chezmoi git' # chezmoi [g]it
alias czu='chezmoi update --no-pager' # chezmoi [u]pdate
alias czd='chezmoi diff' # chezmoi [d]iff
alias czD='chezmoi data --format yaml' # chezmoi [D]ata
alias czm='chezmoi merge' # chezmoi [m]erge
alias czM='chezmoi managed' # chezmoi [M]anaged
alias czU='chezmoi unmanaged' # chezmoi [U]nmanaged
alias czX='chezmoi execute-template' # chezmoi e[X]ecute-template

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim='mvim -v'
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# asdf
alias aua='asdf plugin update --all'
alias apu='asdf plugin update'
alias ala='asdf list all'
alias rlv='asdf list all ruby | rg "^\d"'

# Git Aliases
alias gs='git status'
alias gsb='git status --short --branch'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git commit -m'
alias gcim='git commit -m'
alias gci='git commit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git reset HEAD'
alias gunc='git reset --soft HEAD^'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git log --graph --date=short'
alias glg='git log --graph --date=short'
alias glog='git log --graph --date=short'
alias co='git checkout'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git branch -v'
alias grb='git recent-branches'
alias gtr='grb track'
alias gpub='grb publish'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git checkout -b' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git tag -n'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console' # Rails 2
alias cod='script/console --debugger'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
alias ts='thin start -a ${VM_IP:-127.0.0.1}'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

# db:migrate
alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'
alias zr='zeus rspec'
alias zrc='zeus rails c'
alias zrs='zeus rails s'
alias zrdbm='zeus rake db:migrate'
alias zrdbtp='zeus rake db:test:prepare'
alias zzz='rm .zeus.sock; pkill zeus; zeus start'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'

# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# spring
alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

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
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && dir=$(dirname "$file") && cd "$dir" || return
}

# cd into recent directories
zd() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

alias j=zd
alias z=zd

#alias v='f -e vim'

# shellcheck disable=SC2328,2327,2091
if $(command -v nvim > /dev/null 2>&1); then
  alias vim=nvim
fi
alias ts='tmux new-session -s'
alias ave='aws-vault exec --duration=12h'
alias avc='aws-vault clear'
alias avl='aws-vault list'

# shellcheck disable=SC1091
[ -e "$HOMEBREW_PREFIX/etc/grc.zsh" ] && source "$HOMEBREW_PREFIX/etc/grc.zsh"
#alias weather='curl  "wttr.in?format=2"'
alias weather='http --body "wttr.in?format=2"'
alias cb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'

# Taskwarrior aliases
alias in="task add +in"
alias inbox="task in"
alias next="task next"
