if [ -d ${HOME}/.bash-my-aws ]; then

    dirapp PATH $HOME/.bash-my-aws/bin
    source $HOME/.bash-my-aws/aliases
    autoload -U +X compinit && compinit
    autoload -U +X bashcompinit && bashcompinit
    source $HOME/.bash-my-aws/bash_completion.sh

fi
