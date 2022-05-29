" Automatically treat .es6 extension files as javascript
augroup es6-javascript
  autocmd!
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
augroup END
