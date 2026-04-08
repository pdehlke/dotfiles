# Install hooks for various language version
# managers. We handle pyenv separately in
# 05_pyenv.sh because python is speshul.

if quiet_which direnv; then
  eval "$(direnv hook zsh)"
fi

# Our ember projects are pinned to node 12.
# We've found that 12.22.12 is mostly viable
# across developers' systems.
#
# "The node community made it clear that they value
# expressivity and velocity over robustness and predictability."
# -Bryan Cantrill
#
if [[ -f $(brew --prefix nvm)/nvm.sh ]]; then
  export NVM_DIR=${HOME}/.nvm
  source $(brew --prefix nvm)/nvm.sh
  if [[ $(node -v) != "v12.22.12" ]]; then
    nvm install v12.22.12 >/dev/null 2>&1
    nvm alias default v12.22.12 >/dev/null 2>&1
  fi
fi

# Install JDKs/JVMs via homebrew please. They end up
# in the right place and jenv will handle it all.
# Use 1.8 by default
#
if quiet_which jenv; then
  eval "$(jenv init -)"
  jenv enable-plugin export >/dev/null 2>&1
  for i in /Library/Java/JavaVirtualMachines/*; do
    jenv add $i/Contents/Home >/dev/null 2>&1
  done
  jenv global 17
fi

# We don't use much ruby, but if you do, here's your huckleberry.
#
if quiet_which rbenv; then
  eval "$(rbenv init -)"
fi

# golang had so much promise...
#
if quiet_which goenv; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi
