Plug 'jistr/vim-nerdtree-tabs'
Plug 'preservim/nerdtree'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
endif
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
