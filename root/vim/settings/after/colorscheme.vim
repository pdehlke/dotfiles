" Make it beautiful - colors

set termguicolors

" Disable Solarized Enhancements so Gruvbox or other theme load correctly
" let g:yadr_disable_solarized_enhancements=1

set background=dark

" Status line colorscheme
let g:lightline.colorscheme='solarized'

""" Colorscheme
""" Don't abort if our color scheme is not installed.
try
  colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
