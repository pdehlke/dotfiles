if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"

  # Hybrid cd: two args -> zsh's substitution cd (cd old new); an existing
  # file -> its parent directory (vi /foo/bar/baz; cd !$); everything else
  # -> zoxide (real dirs cd normally, keywords jump by frecency).
  function cd() {
    if (( $# == 2 )); then
      builtin cd "$1" "$2"
    elif [[ -f "$1" ]]; then
      builtin cd "${1:h}"
    else
      __zoxide_z "$@"
    fi
  }
fi

if [[ -z "$ZOXIDIFY_EDITORS" ]]; then
    ZOXIDIFY_EDITORS=(
      nvim
      subl
    )
fi

if [[ -z "$ZOXIDIFY_PREFIX" ]]; then
    ZOXIDIFY_PREFIX='z'
fi

if [[ -z "$ZOXIDIFY_INTERACTIVE_PREFIX" ]]; then
    ZOXIDIFY_INTERACTIVE_PREFIX="${ZOXIDIFY_PREFIX}i"
fi

__ZOXIDIFY_GET_ALIAS_EXISTS=$(( $+functions[zoxidify_get_alias] ))
__ZOXIDIFY_GET_INTERACTIVE_ALIAS_EXISTS=$(( $+functions[zoxidify_get_interactive_alias] ))

__zoxidify_get_zoxide_out() {
    local zoxide_args="$1"
    [[ -z "$zoxide_args" ]] || zoxide_args="$zoxide_args "

    echo "
        local zoxide_out
        zoxide_out=\"\$(zoxide query $zoxide_args\"\$last_arg\")\"
        [[ -z \"\$zoxide_out\" ]] && return 1
    "
}

__ZOXIDIFY_GET_ZOXIDE_OUT="$(__zoxidify_get_zoxide_out)"
__ZOXIDIFY_GET_ZOXIDE_INTERACTIVE_OUT="$(__zoxidify_get_zoxide_out --interactive)"

unset -f __zoxidify_get_zoxide_out

__ZOXIDIFY_GET_LAST_ARG="
    local last_arg
    last_arg=\"\${@:\$#}\"
"

__zoxidify_patch_editor() {
    local editor="$1"

    local launch_editor="
        $editor \"\${(qq)@:1:\$((\$# - 1))}\" \"\$zoxide_out\"
    "

    local editor_alias
    editor_alias="$([[ "$__ZOXIDIFY_GET_ALIAS_EXISTS" -eq 1 ]] && zoxidify_get_alias "$editor")"
    editor_alias="${editor_alias:-$ZOXIDIFY_PREFIX$editor}"

    local interactive_alias
    interactive_alias="$([[ "$__ZOXIDIFY_GET_INTERACTIVE_ALIAS_EXISTS" -eq 1 ]] && zoxidify_get_interactive_alias "$editor")"
    interactive_alias="${interactive_alias:-$ZOXIDIFY_INTERACTIVE_PREFIX$editor}"

    eval "
        function $editor_alias() {
            $__ZOXIDIFY_GET_LAST_ARG
            $__ZOXIDIFY_GET_ZOXIDE_OUT
            $launch_editor
        }

        function $interactive_alias() {
            $__ZOXIDIFY_GET_LAST_ARG
            $__ZOXIDIFY_GET_ZOXIDE_INTERACTIVE_OUT
            $launch_editor
        }
    "
}

__zoxidify_main() {
    if (( ! $+commands[zoxide] )); then
        echo '[\e[1;31m!\e[0m] \e[1;31mZoxidify (ZSH plugin): Zoxide is not installed. Please install Zoxide first.\e[0m'
        return 1
    fi

    local editor
    for editor in "${ZOXIDIFY_EDITORS[@]}"; do
        if command -v "$editor" &> /dev/null; then
            __zoxidify_patch_editor "$editor"
        fi
    done
}

__zoxidify_main

[[ "$__ZOXIDIFY_GET_ALIAS_EXISTS" -eq 1 ]] && unset -f zoxidify_get_alias
[[ "$__ZOXIDIFY_GET_INTERACTIVE_ALIAS_EXISTS" -eq 1 ]] && unset -f zoxidify_get_interactive_alias

unset -f __zoxidify_patch_editor __zoxidify_main
unset -v __ZOXIDIFY_GET_LAST_ARG __ZOXIDIFY_GET_ZOXIDE_OUT __ZOXIDIFY_GET_ZOXIDE_INTERACTIVE_OUT \
    __ZOXIDIFY_GET_ALIAS_EXISTS __ZOXIDIFY_GET_INTERACTIVE_ALIAS_EXISTS \
    ZOXIDIFY_EDITORS ZOXIDIFY_PREFIX ZOXIDIFY_INTERACTIVE_PREFIX
