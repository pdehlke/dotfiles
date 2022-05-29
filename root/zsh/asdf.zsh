### ASDF Config

if [ -d "$HOME/.asdf" ]; then
  ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
  ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
  export ASDF_DIR ASDF_DATA_DIR

  # Dont source `~/.asdf/asdf.sh`
  PATH="$ASDF_DIR/bin:$PATH"

  source $ASDF_DIR/lib/asdf.sh # just load the asdf wrapper function

fi

##### direnv
# direnv hook zsh
if [ -d "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv" ]; then
  source ${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc
fi
