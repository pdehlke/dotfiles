### ASDF Config
if [ -d "${ASDF_DIR:-$HOME/.asdf}" ]; then
  ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
  ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
  export ASDF_DIR ASDF_DATA_DIR

  # Don't source `$ASDF_DIR/asdf.sh`
  #source $ASDF_DIR/asdf.sh

  # prepend $ASDF_DIR/bin to PATH
  PATH="$ASDF_DIR/bin:$PATH"

  ### append zsh completions
  fpath=(
    $fpath
    $ASDF_DIR/completions
  )
fi

##### Direnv
# direnv hook zsh
if [ -d "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv" ]; then
  source ${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc
fi
