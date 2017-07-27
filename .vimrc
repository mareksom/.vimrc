set ai
set ts=2
set shiftwidth=2
set expandtab
set colorcolumn=81
syntax on

" Jumps to last postion, when file is reopened.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufNewFile,BufRead *.phptex set syntax=phptex

autocmd FileType make set noexpandtab

highlight EOLWS ctermbg=green ctermfg=green guibg=green guifg=green
autocmd Syntax * syn match EOLWS /\s\+$\| \+\ze\t/ containedin=ALL

au BufRead,BufNewFile *.go set filetype=go

function! InsertRandomDigit(digits)
  :let i = a:digits
  :while 0 < i
  :  exe 'norm i' . system("echo -n $(($RANDOM \% 10))")
  :  let i -= 1
  :endwhile
endfunction
map \rd :<C-U>call InsertRandomDigit(v:count1)<CR>

function! InsertRandomHexNumber(digits)
  :let i = a:digits
  :while 0 < i
  :  exe 'norm i' . system("printf \"\%X\" $(($RANDOM \% 16))")
  :  let i -= 1
  :endwhile
  :exe 'norm i0x'
endfunction
map \rh :<C-U>call InsertRandomHexNumber(v:count1)<CR>

highlight ALTGRSPACE ctermbg=red ctermfg=red guibg=red guifg=red
autocmd Syntax * syn match ALTGRSPACE / / containedin=ALL
