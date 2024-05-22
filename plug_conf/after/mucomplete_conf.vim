" NOTE: use the tab and s-tab to navigate
inoremap <expr> <CR> pumvisible() ? "\<C-y>":"\<CR>"

inoremap <silent> <plug>(MUcompleteFwdKey) <c-l>
imap <silent> <unique> <c-l> <plug>(MUcompleteCycFwd)

inoremap <silent> <plug>(MUcompleteBwdKey) <c-h>
imap <silent> <unique> <c-h> <plug>(MUcompleteCycBwd)
