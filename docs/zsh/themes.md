### Customizing Powerlevel10k

Run `p10k configure` to access the builtin configuration wizard right from your terminal.


    # Wizard options: nerdfont-v3 + powerline, small icons, rainbow, unicode,
    # 24h time, angled separators, sharp heads, flat tails, 2 lines, disconnected,
    # full frame, dark-ornaments, compact, many icons, concise, instant_prompt=verbose.
    # Type `p10k configure` to generate another config.


The following settings are overwritten in `${HOME}/.config/shell/theme.zsh`:

  - Transient prompt on same dir
  - Fewer elements on right prompt
  - mise-en-place glob patterns to show tool versions

Keep in mind that only the following theme options will match your terminal color settings: **rainbow**, **lean with 8 colors** and **pure original**.
All the remaining options have fixed colors.

### Customizing ZSH with `~/.zsh.after/`

If you want to customize your zsh experience, yadr provides hooks via the `${HOME}/.zsh.after/` directory. You can add options
and short snippets to `${HOME}/.zshrc` if you like, and this is the preferred method for `zsh4humans`. YADR includes extensive
additional customizations in `.zsh.after` to keep the configuration modular and easily digestible. 
Files in `.zsh.after` that have a `.zsh` suffix will be sourced after other zsh customizations that come from `zsh4humans`; they will
be read in lexical order.



### Overriding the theme

YADR uses [zsh4humans](https://github.com/romkatv/zsh4humans), and z4h uses [powerlevel10k](https://github.com/romkatv/powerlevel10k). p10k is 
[wildly configurable](https://github.com/romkatv/zsh4humans#customizing-prompt), but YADR, like zsh4humans, is an extremely opinionated setup 
and major surgery may be required if you really want to use a different prompt. I cannot offere any guidance, and issues opened about this
will be immediately closed as _won't fix_

