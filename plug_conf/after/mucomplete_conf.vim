<<<<<<< HEAD
inoremap <expr> <CR> pumvisible() ? "\<C-y>":"\<CR>"
=======
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

inoremap <silent> <plug>(MUcompleteFwdKey) <c-j>
imap <silent> <unique> <c-j> <plug>(MUcompleteCycFwd)

inoremap <silent> <plug>(MUcompleteBwdKey) <c-k>
imap <silent> <unique> <c-k> <plug>(MUcompleteCycBwd)
>>>>>>> 976056b4f18be19b071ab27be40d9a244c9297b2
