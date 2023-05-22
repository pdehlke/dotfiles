function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

if executable('rg')
  const g:fzf_grep_prg = "Rg"
elseif executable('ag')
  const g:fzf_grep_prg = "Ag"
endif

if exists('g:fzf_grep_prg')
  "grep the current word using ,k (mnemonic Kurrent)
  nnoremap <silent> <leader>k :execute g:fzf_grep_prg . " " . expand("<cword>")<CR>

  "grep visual selection
  vnoremap <leader>k :<C-U>execute g:fzf_grep_prg . " " . GetVisual()<CR>

  "grep current word up to the next exclamation point using ,K
  nnoremap <leader>K viwf!:<C-U>execute g:fzf_grep_prg . " " . GetVisual()<CR>

  "grep for 'def foo'
  nnoremap <silent> <leader>ggd :execute g:fzf_grep_prg . " def " . expand("<cword>")<CR>

  ",gg = Grep! - using RipGrep
  " open up a grep line, with a quote started for the search
  nnoremap <leader>gg :g:fzf_grep_prg 

  "Grep for usages of the current file
  nnoremap <leader>gcf :exec g:fzf_grep_prg . " " . expand("%:t:r")<CR>

  " Grep for the last search.
  nnoremap <silent> <leader>qa/ :execute g:fzf_grep_prg . "! " . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "")<CR>
endif
