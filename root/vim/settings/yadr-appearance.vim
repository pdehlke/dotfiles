" Make it beautiful - colors and fonts

if has('gui_running')
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  augroup yadr-appearance
    autocmd!
    autocmd VimEnter * set guitablabel=%N:\ %t\ %M
  augroup END

  set lines=60
  set columns=190

  if has('gui_gtk')
    set guifont=Inconsolata\ LGC\ Nerd\ Font\ 12,Hack\ 12
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  endif
else
  let g:CSApprox_loaded = 1

  " For people using a terminal that is not Solarized
  if exists('g:yadr_using_unsolarized_terminal')
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
  endif

  if $COLORTERM ==? 'gnome-terminal'
    set term=gnome-256color
    set t_Co=256
  elseif $TERM =~? 'kitty'
    set term=xterm-kitty
  elseif $TERM =~? 'direct'
    set term=xterm-direct
  elseif $TERM =~? 'xterm'
    set term=xterm-256color
    set t_Co=256
  elseif $TERM ==? 'tmux-256color'
    set term=xterm-256color
    set t_Co=256
  endif

  if has('patch-9.0.0930')
    set keyprotocol=kitty:kitty,xterm:mok2,alacritty:mok2
  endif

endif

