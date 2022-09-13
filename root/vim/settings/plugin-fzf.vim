"" fzf.vim
let $FZF_DEFAULT_COMMAND = "find -L -mindepth 1 \\( -path '*/\\.git' -o -path '*/node_modules' -o -path '*/target' -o -path '*/dist' \\) -prune -o \\( -type f -o -type l \\) -print 2> /dev/null"
set grepprg=git\ grep\ --line-number

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  " Caution, it uses gitignore patterns, to include vcs ignored, add
  " `--no-ignore-vcs`
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
endif

" Additional mapping for buffer search
nnoremap <silent> <leader>b :Buffers<CR>
" File search
nnoremap <silent> <leader>t :Files<CR>
" Files under version control
nnoremap <silent> <leader>e :GFiles<CR>
"Recovery commands from history through FZF
" nmap <leader>y :History:<CR>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open FZF starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map <leader>ja :Files app/assets<CR>
map <leader>jm :Files app/models<CR>
map <leader>jc :Files app/controllers<CR>
map <leader>jv :Files app/views<CR>
map <leader>jj :Files app/assets/javascripts<CR>
map <leader>jh :Files app/helpers<CR>
map <leader>jl :Files lib<CR>
map <leader>jp :Files public<CR>
map <leader>js :Files spec<CR>
map <leader>jf :Files fast_spec<CR>
map <leader>jd :Files db<CR>
map <leader>jC :Files config<CR>
map <leader>jV :Files vendor<CR>
map <leader>jF :Files factories<CR>
map <leader>jT :Files test<CR>

