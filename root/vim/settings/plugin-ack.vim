" Open the Ag command and place the cursor into the quotes
nmap <Leader>ag :Ack ""<Left>
nmap <Leader>af :AckFile ""<Left>

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
