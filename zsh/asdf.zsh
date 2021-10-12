### ASDF Config

if [ -d "$HOME/.asdf" ]; then
  # . $HOME/.asdf/asdf.sh
  ASDF_DIR="$HOME/.asdf"

  # Dont source `~/.asdf/asdf.sh`
  PATH="$ASDF_DIR/bin:$PATH"

  source $ASDF_DIR/lib/asdf.sh # just load the asdf wrapper function

  ##### direnv
  # A shortcut for asdf managed direnv.
  direnv() { asdf exec direnv "$@"; }

  # direnv hook zsh
  eval "$(asdf exec direnv hook zsh)"
fi

