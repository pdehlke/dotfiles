# Install hooks for various language version
# managers. We handle pyenv separately in
# 05_pyenv.sh because python is speshul.

if quiet_which direnv; then
  eval "$(direnv hook zsh)"
fi

if [[ -f $(brew --prefix nvm)/nvm.sh ]]; then
  export NVM_DIR=${HOME}/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

if quiet_which jenv; then
  eval "$(jenv init -)"
fi

if quiet_which rbenv; then
  eval "$(rbenv init -)"
fi

if quiet_which asdf; then
  . $(brew --prefix asdf)/libexec/asdf.sh
fi

if quiet_which goenv; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi
