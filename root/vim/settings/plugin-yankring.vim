let g:yankring_history_file = '.yankring-history'
nnoremap <leader>yr :YRShow<CR>
nnoremap <C-y> :YRShow<CR>

function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
