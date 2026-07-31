if (( $+commands[carapace] )); then
  # zsh: fall back to zsh's own completion functions for commands carapace
  # doesn't know natively. bash: same, via bash-completion (installed).
  export CARAPACE_BRIDGES='zsh,bash'

  # git excluded: carapace ships a native git completer that would
  # compdef over zsh's stock _git, breaking 02_gitflow.zsh's _git-flow
  # integration and its 'user-commands flow:...' zstyle.
  #
  # docker excluded: carapace's bundled docker completer (73 subcommands)
  # lags Homebrew's generated _docker (85, includes compose/buildx/scout/
  # mcp/model/etc.). Falling back to zsh's stock _docker keeps completion
  # current with whatever docker CLI is actually installed.
  #
  # Everything else is fair game.
  export CARAPACE_EXCLUDES='git,docker'

  # z4h sets `zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'`, so a
  # lower-case prefix matches upper-case candidates for every completer
  # that runs inside zsh. carapace never sees that zstyle: it filters
  # candidates in Go against the current word and hands zsh only the
  # survivors, so without this an `ls si<TAB>` against `Silly.doc` returns
  # an empty set and Tab does nothing at all.
  #
  # Accepted values are 'CASE_SENSITIVE' (default) and 'CASE_INSENSITIVE',
  # or their ordinals; the name is used here because the ordinal shifts if
  # upstream ever inserts a mode ahead of it (pkg/match/match.go).
  #
  # Note this is broader than z4h's matcher: carapace folds case in both
  # directions, where 'm:{a-z}={A-Z}' only widens lower to upper.
  export CARAPACE_MATCH=CASE_INSENSITIVE

  # compinit already ran inside z4h init (see dot_zshrc.tmpl); do not
  # add another here (see docs/zsh-config-cleanup-2026-07.md).
  #
  # carapace writes its own `list-colors` zstyle for every completed
  # command's curcontext, in zsh's rich match-highlight syntax (multiple
  # `=`-separated fields per entry). z4h's own fzf-popup colorizer
  # (-z4h-set-list-colors, in $Z4H/zsh4humans/fn/) only understands simple
  # GNU dircolors "code=value" pairs and crashes ("bad set of key/value
  # pairs for associative array") when it reads carapace's value back.
  # Strip that one zstyle call from carapace's generated script before
  # sourcing it; z4h's own LS_COLORS-derived list-colors zstyle (set once
  # in -z4h-compinit) still applies, so completions stay colored -- just
  # without carapace's own per-match highlighting.
  #
  # The second sed un-doubles backslashes in carapace's match values.
  #
  # carapace's zsh formatter (internal/shell/zsh/action.go) escapes every
  # match twice. quoteValue() applies defaultReplacer, which turns a space
  # into '\ ' and a backslash into '\\'; the result is then run through
  # describeReplacer, which turns each of those backslashes into '\\'
  # again. So the file `foo bar one.txt` leaves carapace as
  # `foo\\ bar\\ one.txt`.
  #
  # That is deliberate on carapace's side. _carapace_completer feeds the
  # values to `_describe -Q`, and _describe un-escapes '\X' -> 'X' before
  # calling compadd -- but only on the branch it takes when the
  # `list-grouped` zstyle is true (Completion/Base/Utility/_describe:112 in
  # zsh 5.9). z4h's Tab widget shadows the zstyle builtin for the duration
  # of a completion and hardcodes `list-grouped` to false so it can render
  # matches in its own fzf popup (see the shadow zstyle() near the top of
  # $Z4H/zsh4humans/fn/z4h-fzf-complete). _describe therefore skips the
  # un-escaping branch and the doubled backslashes reach the command line
  # verbatim: `ls foo<TAB>` yields `ls foo\\ bar\\ ` instead of
  # `ls foo\ bar\ `.
  #
  # Two things break as a result. The obvious one is that the command line
  # is now wrong -- `foo\` and `bar\` parse as separate words. The subtler
  # one is that Tab completion appears to die on any filename with a space
  # in it: z4h only opens its fzf selector when the first Tab left $BUFFER
  # untouched (z4h-fzf-complete checks `[[ $buf == $BUFFER ]]`), and the
  # mangled insertion always changes $BUFFER. The widget then falls through
  # to its `[[ $LBUFFER == *' ' ]]` guard, which returns outright because
  # the inserted text ends in an escaped space, so no chooser ever opens.
  # auto_menu does not help here; that guard runs after the auto_menu
  # branch. Every carapace-managed command is affected, which is roughly
  # 600 of them; git and docker escape it only because CARAPACE_EXCLUDES
  # above keeps zsh's own completers in place for those two.
  #
  # Undoing describeReplacer on the values array immediately before
  # _describe restores single-level escaping for spaces, quotes, globs,
  # parens, '$' and literal backslashes alike. Values only: the displays
  # array still goes through compdescribe, which does un-escape it, so
  # touching that would under-escape the ':' separator carapace relies on
  # for `value:description` pairs.
  #
  # Upstream carapace-bin is v1.7.3, which is what this workaround was
  # written against; no upstream issue is filed. Revisit if carapace stops
  # applying describeReplacer to values, or if z4h stops forcing
  # list-grouped off -- either change makes this sed a double-unescape.
  source <(carapace _carapace \
    | sed -e '/list-colors "${zstyle}"/d' \
          -e 's|^\( *\)\[\[ ${#valuesArr|\1valuesArr=("${(@)valuesArr//\\\\\\\\/\\\\}"); [[ ${#valuesArr|')
fi
