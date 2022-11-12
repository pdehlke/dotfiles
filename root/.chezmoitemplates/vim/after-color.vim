  {{- /* fix neovim */}}
if !has('nvim')
  let g:lightline.colorscheme = '{{ trimSuffix "_light" . }}'
endif

  {{- /* fix solarized theme */}}
  {{- if regexMatch "solarized" . }}
" set notermguicolors
let g:yadr_disable_solarized_enhancements = 0
let g:airline_theme = 'solarized
    {{- if not (regexMatch "light" .) -}}
_flood
    {{- end -}}
'
  {{- else }}
" set termguicolors
let g:yadr_disable_solarized_enhancements = 1
let g:yadr_using_unsolarized_terminal = 1
let g:airline_theme = '{{ trimSuffix "_light" . }}'
  {{- end }}
colorscheme {{ trimSuffix "_light" . }}

  {{- /* fix light themes */}}
  {{- if regexMatch "light" . }}
set background=light
  {{- end }}
