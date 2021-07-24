" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" ==== NERD tree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
" " calls NERDTreeFind if NERDTree is active, current window contains a
" " modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

" ==== NERD tree
if LINUX()
  " Alt-Shift-N for nerd tree
  nmap <A-N> :NERDTreeToggle<CR>
elseif OSX()
  " Cmd-Shift-N for nerd tree
  nmap <D-N> :NERDTreeToggle<CR>
endif
