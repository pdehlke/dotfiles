  {{- /* fix neovim */}}
if !has('nvim')
  let g:lightline.colorscheme = '{{ . }}'
endif

  {{- /* fix solarized theme */}}
  {{- if eq . "solarized" }}
" set notermguicolors
let g:yadr_disable_solarized_enhancements = 0
let g:airline_theme = 'solarized_flood'
  {{- else }}
" set termguicolors
let g:yadr_disable_solarized_enhancements = 1
let g:yadr_using_unsolarized_terminal = 1
let g:airline_theme = '{{ . }}'
  {{- end }}
colorscheme {{ . }}
