### ASDF Config
if [ -d "${ASDF_DIR:-$HOME/.asdf}" ]; then
  ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
  ASDF_DATA_DIR="${ASDF_DATA_DIR:-$ASDF_DIR}"
  export ASDF_DIR ASDF_DATA_DIR

  # Don't source `$ASDF_DIR/asdf.sh`
  if [ -f "$ASDF_DIR/lib/asdf.sh" ]; then
    source $ASDF_DIR/lib/asdf.sh
  fi

  # prepend $ASDF_DIR/bin to PATH
  path=(
    $ASDF_DIR/bin
    $path
  )

  ### append zsh completions
  fpath=(
    $fpath
    $ASDF_DIR/completions
  )
fi

##### Direnv
# direnv hook zsh
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc" ]; then
  source ${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc
fi
