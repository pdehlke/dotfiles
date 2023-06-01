#Load themes from yadr and from user's custom prompts in ~/.zsh.prompts
autoload promptinit
fpath=($yadr/zsh/custom-prompts $HOME/.zsh.prompts $fpath)
promptinit
