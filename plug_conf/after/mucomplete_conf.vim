function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-y>":"\<CR>"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ asyncomplete#force_refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

inoremap <silent> <plug>(MUcompleteFwdKey) <c-h>
imap <silent> <unique> <c-h> <plug>(MUcompleteCycFwd)

inoremap <silent> <plug>(MUcompleteBwdKey) <c-l>
imap <silent> <unique> <c-l> <plug>(MUcompleteCycBwd)
