# Prompt to fix mistyped command names ("zsh: correct 'gti' to 'git' [nyae]?"),
# replicating prezto's utility module. CORRECT only touches the command word;
# CORRECT_ALL is the variant that also prompts on arguments (e.g. filenames
# that don't exist yet), which is why it is deliberately not set here.
setopt CORRECT

# Never offer completion internals (_git, _files, ...) as corrections.
CORRECT_IGNORE='_*'
