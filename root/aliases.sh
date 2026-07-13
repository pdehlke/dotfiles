# Aliases sourced by .zshrc via z4h. zsh-only: uses alias -g, TRAPHUP,
# and $+commands, so don't source this from bash.
# vim:ft=zsh:

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# Return the prompt to the bottom if we're in zsh4humans
(( $+functions[z4h-clear-screen-soft-bottom] )) && alias clear='z4h-clear-screen-soft-bottom'

# PS
alias psa='ps aux'
alias psg='ps aux | grep '

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
alias -g N='> /dev/null'
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='/bin/ls -alGhAF'
  alias ls='/bin/ls -GhAF'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  # shellcheck disable=SC2154
  source "$yadr/aliases.sh"
}

alias ae='vim $yadr/aliases.sh'         # alias edit
alias ar='source $yadr/aliases.sh'      # alias reload
alias gar='killall -HUP -u "$USER" zsh' # global alias reload

# chezmoi aliases
alias czI='chezmoi init'                    # chezmoi [I]nit
alias czh='chezmoi cd'                      # chezmoi [h]ome
alias cza='chezmoi apply --no-pager'        # chezmoi [a]pply
alias czA='chezmoi add'                     # chezmoi [A]dd
alias czc='chezmoi cat'                     # chezmoi [c]at
alias cze='chezmoi edit --apply --no-pager' # chezmoi [e]dit
alias czC='chezmoi cat-config'              # chezmoi [C]at-config
alias czE='chezmoi edit-config'             # chezmoi [E]dit-config
alias czf='chezmoi forget'                  # chezmoi [f]orget
alias czg='chezmoi git'                     # chezmoi [g]it
alias czu='chezmoi update --no-pager'       # chezmoi [u]pdate
alias czd='chezmoi diff'                    # chezmoi [d]iff
alias czD='chezmoi data --format yaml'      # chezmoi [D]ata
alias czm='chezmoi merge'                   # chezmoi [m]erge
alias czM='chezmoi managed'                 # chezmoi [M]anaged
alias czU='chezmoi unmanaged'               # chezmoi [U]nmanaged
alias czX='chezmoi execute-template'        # chezmoi e[X]ecute-template

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
alias gpr='git pr' # checkout someone else's PR locally (git-extras)
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
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git checkout -b' # new branch aka checkout -b
alias gcb='git create-branch -r' # new branch + remote tracking in one step (git-extras)
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
alias gdsb='git delete-squashed-branches' # clean up squash-merged branches gdmb can't see (git-extras)

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

alias path='echo $PATH | tr : "\n"'

# alias listening="sudo lsof -iTCP -sTCP:LISTEN -n -P"

alias cat=bat
alias pfm=npm
alias history='history -i'

# shellcheck disable=SC2328,2327,2091
if $(command -v nvim >/dev/null 2>&1); then
  alias vim=nvim
fi
alias ts='tmux new-session -s'

# shellcheck disable=SC1091
[ -e "$HOMEBREW_PREFIX/etc/grc.zsh" ] && source "$HOMEBREW_PREFIX/etc/grc.zsh"
alias weather='http --body "wttr.in?format=2"'
alias cb='git branch --sort=-committerdate | peco --prompt "Checkout>" | xargs git checkout'
alias db='git branch --sort=-committerdate | grep -v "\*" | peco --prompt "Delete>" | xargs -n 1 git delete-branch'

# Taskwarrior aliases
alias in="task add +in"
alias inbox="task in"
alias next="task next"
