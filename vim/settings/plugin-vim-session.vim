" session management
let g:session_directory = $HOME.'/.cache/vim/sessions'
let g:session_command_aliases = 1
" Prevent vim-session from asking us to load the session.
" If you want to load the session, use :SaveSession and :OpenSession
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

