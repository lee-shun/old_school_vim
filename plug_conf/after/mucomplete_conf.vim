inoremap <expr> <CR> pumvisible() ? "\<C-y>":"\<CR>"
imap <unique> <tab> <plug>(MUcompleteFwd)
imap <unique> <s-tab> <plug>(MUcompleteBwd)

inoremap <silent> <plug>(MUcompleteFwdKey) <c-h>
imap <silent> <unique> <c-h> <plug>(MUcompleteCycFwd)

inoremap <silent> <plug>(MUcompleteBwdKey) <c-l>
imap <silent> <unique> <c-l> <plug>(MUcompleteCycBwd)
