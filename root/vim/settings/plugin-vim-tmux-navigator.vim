" Don't allow any default key-mappings.
let g:tmux_navigator_no_mappings = 1

" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" If the tmux window is zoomed, keep it zoomed when moving from Vim to another pane
" Tip: combine with select-pane -Z on tmux.conf
"let g:tmux_navigator_preserve_zoom = 1
