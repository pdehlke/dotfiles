"" NERDTree configuration
let g:NERDTreeIgnore=['\.git$', '\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']

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
nnoremap <silent> <F2> :call OpenNerdTree()<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" ==== NERD tree
if LINUX()
  " Alt-Shift-N for nerd tree
  nmap <A-N> :NERDTreeToggle<CR>
  " ,Shift-N for nerd tree
  nmap <Leader>N :NERDTreeToggle<CR>
elseif OSX()
  " Cmd-Shift-N for nerd tree
  nmap <D-N> :NERDTreeToggle<CR>
endif
