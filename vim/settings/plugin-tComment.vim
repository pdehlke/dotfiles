" tComment
" ========================================
" extensions for tComment plugin. Normally
" tComment maps 'gcc' to comment current line
" this adds 'gcp' comment current paragraph (block)
" using tComment's built in <c-_>p mapping
nmap <silent> gcp <C-_>p

if LINUX()
  " Alt-/ to toggle comments
  map  <A-/> :TComment<CR>
  imap <A-/> <Esc>:TComment<CR>i
  " ,/ to toggle comments
  map  <Leader>/ :TComment<CR>
  imap <Leader>/ <Esc>:TComment<CR>i
elseif OSX()
  " Command-/ to toggle comments
  map  <D-/> :TComment<CR>
  imap <D-/> <Esc>:TComment<CR>i
endif
