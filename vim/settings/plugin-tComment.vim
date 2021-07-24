" tComment
" ========================================
" extensions for tComment plugin. Normally
" tComment maps 'gcc' to comment current line
" this adds 'gcp' comment current paragraph (block)
" using tComment's built in <c-_>p mapping
nmap <silent> gcp <c-_>p

if LINUX()
  " Alt-/ to toggle comments
  imap <A-/> <Esc>:TComment<CR>i
  map <A-/> :TComment<CR>
elseif OSX()
  " Command-/ to toggle comments
  map <D-/> :TComment<CR>
  imap <D-/> <Esc>:TComment<CR>i
endif
