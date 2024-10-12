#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR for the first time"
    git clone --depth=1 https://github.com/pdehlke/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    sh "./install.sh"
else
    echo "YADR is already installed"
fi
