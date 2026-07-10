#!zsh
#
# Brew-provided completions are added to fpath in .zshrc before `z4h init`
# runs compinit; zsh-autosuggestions is bundled and loaded by z4h itself.
# Neither belongs here.
#
# Set up git-flow. This is... extensive. Pay attention.
#
# Installation
# ------------
#
# To achieve git-flow completion nirvana:
#
#  0. Update your zsh's git-completion module to the newest verion.
#     From here. http://zsh.git.sourceforge.net/git/gitweb.cgi?p=zsh/zsh;a=blob_plain;f=Completion/Unix/Command/_git;hb=HEAD
#
#  1. Install this file. Either:
#
#     a. Place it in your .zshrc:
#
#     b. Or, copy it somewhere (e.g. ~/.git-flow-completion.zsh) and put the following line in
#        your .zshrc:
#
#            source ~/.git-flow-completion.zsh
#
#     c. Or, use this file as a oh-my-zsh plugin.
#

_git-flow() {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments -C \
    ':command:->command' \
    '*::options:->options'

  case $state in
    (command)

      local -a subcommands
      subcommands=(
        'init:initialize a new git repo with support for the branching model'
        'feature:manage your feature branches'
        'release:manage your release branches'
        'hotfix:manage your hotfix branches'
        'support:manage your support branches'
        'version:show version information'
      )
      _describe -t commands 'git flow' subcommands
    ;;

    (options)
      case $line[1] in

        (init)
          _arguments \
            -f'[force setting of gitflow branches, even if already configured]'
          ;;

          (version)
          ;;

          (hotfix)
            __git-flow-hotfix
          ;;

          (release)
            __git-flow-release
          ;;

          (feature)
            __git-flow-feature
          ;;
      esac
    ;;
  esac
}

__git-flow-release() {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments -C \
    ':command:->command' \
    '*::options:->options'

  case $state in
    (command)

      local -a subcommands
      subcommands=(
        'start:start a new release branch'
        'finish:finish a release branch'
        'list:list all your release branches (alias to `git flow release`)'
        'publish:publish release branch to remote'
        'track:checkout remote release branch'
      )
      _describe -t commands 'git flow release' subcommands
      _arguments \
        -v'[verbose (more) output]'
    ;;

    (options)
      case $line[1] in

        (start)
          _arguments \
            -F'[fetch from origin before performing finish]'\
            ':version:__git_flow_version_list'
        ;;

        (finish)
          _arguments \
            -F'[fetch from origin before performing finish]' \
            -s'[sign the release tag cryptographically]'\
            -u'[use the given GPG-key for the digital signature (implies -s)]'\
            -m'[use the given tag message]'\
            -p'[push to $ORIGIN after performing finish]'\
            ':version:__git_flow_version_list'
        ;;

        (publish)
          _arguments \
            ':version:__git_flow_version_list'
        ;;

        (track)
          _arguments \
            ':version:__git_flow_version_list'
        ;;

        *)
          _arguments \
            -v'[verbose (more) output]'
        ;;
      esac
    ;;
  esac
}

__git-flow-hotfix() {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments -C \
    ':command:->command' \
    '*::options:->options'

  case $state in
    (command)

      local -a subcommands
      subcommands=(
        'start:start a new hotfix branch'
        'finish:finish a hotfix branch'
        'list:list all your hotfix branches (alias to `git flow hotfix`)'
      )
      _describe -t commands 'git flow hotfix' subcommands
      _arguments \
        -v'[verbose (more) output]'
    ;;

    (options)
      case $line[1] in

        (start)
          _arguments \
            -F'[fetch from origin before performing finish]'\
            ':hotfix:__git_flow_version_list'\
            ':branch-name:__git_branch_names'
        ;;

        (finish)
          _arguments \
            -F'[fetch from origin before performing finish]' \
            -s'[sign the release tag cryptographically]'\
            -u'[use the given GPG-key for the digital signature (implies -s)]'\
            -m'[use the given tag message]'\
            -p'[push to $ORIGIN after performing finish]'\
            ':hotfix:__git_flow_hotfix_list'
        ;;

        *)
          _arguments \
            -v'[verbose (more) output]'
        ;;
      esac
    ;;
  esac
}

__git-flow-feature() {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments -C \
    ':command:->command' \
    '*::options:->options'

  case $state in
    (command)

      local -a subcommands
      subcommands=(
        'start:start a new feature branch'
        'finish:finish a feature branch'
        'list:list all your feature branches (alias to `git flow feature`)'
        'publish:publish feature branch to remote'
        'track:checkout remote feature branch'
        'diff:show all changes'
        'rebase:rebase from integration branch'
        'checkout:checkout local feature branch'
        'pull:pull changes from remote'
      )
      _describe -t commands 'git flow feature' subcommands
      _arguments \
        -v'[verbose (more) output]'
    ;;

    (options)
      case $line[1] in

        (start)
          _arguments \
            -F'[fetch from origin before performing finish]'\
            ':feature:__git_flow_feature_list'\
            ':branch-name:__git_branch_names'
        ;;

        (finish)
          _arguments \
            -F'[fetch from origin before performing finish]' \
            -r'[rebase instead of merge]'\
            ':feature:__git_flow_feature_list'
        ;;

        (publish)
          _arguments \
            ':feature:__git_flow_feature_list'\
        ;;

        (track)
          _arguments \
            ':feature:__git_flow_feature_list'\
        ;;

        (diff)
          _arguments \
            ':branch:__git_branch_names'\
        ;;

        (rebase)
          _arguments \
            -i'[do an interactive rebase]' \
            ':branch:__git_branch_names'
        ;;

        (checkout)
          _arguments \
            ':branch:__git_flow_feature_list'\
        ;;

        (pull)
          _arguments \
            ':remote:__git_remotes'\
            ':branch:__git_branch_names'
        ;;

        *)
          _arguments \
            -v'[verbose (more) output]'
        ;;
      esac
    ;;
  esac
}

__git_flow_version_list() {
  local expl
  local -a versions

  versions=(${${(f)"$(_call_program versions git flow release list 2> /dev/null | tr -d ' |*')"}})
  __git_command_successful || return

  _wanted versions expl 'version' compadd $* - "${versions[@]}"
}

__git_flow_feature_list() {
  local expl
  local -a features

  features=(${${(f)"$(_call_program features git flow feature list 2> /dev/null | tr -d ' |*')"}})
  __git_command_successful || return

  _wanted features expl 'feature' compadd $* - "${features[@]}"
}

__git_remotes() {
  local expl gitdir remotes

  gitdir=$(_call_program gitdir git rev-parse --git-dir 2>/dev/null)
  __git_command_successful || return

  remotes=(${${(f)"$(_call_program remotes git config --get-regexp '^remote\..*\.url$')"}//#(#b)remote.(*).url */$match[1]})
  __git_command_successful || return

  # TODO: Should combine the two instead of either or.
  if (( $#remotes > 0 )); then
    _wanted remotes expl remote compadd $* - "${remotes[@]}"
  else
    _wanted remotes expl remote _files $* - -W "($gitdir/remotes)" -g "$gitdir/remotes/*"
  fi
}

__git_flow_hotfix_list() {
  local expl
  local -a hotfixes

  hotfixes=(${${(f)"$(_call_program hotfixes git flow hotfix list 2> /dev/null | tr -d ' |*')"}})
  __git_command_successful || return

  _wanted hotfixes expl 'hotfix' compadd $* - "${hotfixes[@]}"
}

__git_branch_names() {
  local expl
  local -a branch_names

  branch_names=(${${(f)"$(_call_program branchrefs git for-each-ref --format='%(refname)' refs/heads 2>/dev/null)"}#refs/heads/})
  __git_command_successful || return

  _wanted branch-names expl branch-name compadd $* - "${branch_names[@]}"
}

__git_command_successful() {
  if (( ${#pipestatus:#0} > 0 )); then
    _message 'not a git repository'
    return 1
  fi
  return 0
}

zstyle ':completion:*:*:git:*' user-commands flow:'provide high-level repository operations'
