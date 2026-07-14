# GNU dircolors (Catppuccin Mocha, see ~/.dircolors). Needs the coreutils
# gnubin dircolors from 000_path.zsh, not BSD/macOS dircolors (unavailable).
if (( $+commands[dircolors] )) && [[ -r "${HOME}/.dircolors" ]]; then
  eval "$(dircolors -b "${HOME}/.dircolors")"
fi
