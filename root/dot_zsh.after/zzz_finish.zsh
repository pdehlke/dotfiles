# Set up mise last so we don't overwrite the PATH it wants to set
eval "$(mise activate zsh)"

# Clean up our path; remove dupes
typeset -U PATH
# PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[ $1]}')
