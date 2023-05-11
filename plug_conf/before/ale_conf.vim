let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:ale_sign_hint = ''

" use other complete engine
let g:ale_completion_enabled = 0

if g:osv_lsp == 'vim-lsp'
    " vim-lsp + ale
    let g:ale_linters = {
                \'python': ['vim-lsp', 'pylint'],
                \'cpp': ['vim-lsp', 'cpplint'],
                \'markdown':['markdownlint']}
else
    let g:ale_linters = {
                \'python': ['pylint'],
                \'cpp': ['cpplint'],
                \'markdown':['markdownlint']}
endif

if g:osv_lsp != 'none'
    let g:ale_disable_lsp = 1
endif

nmap <buffer> ]d :<C-u>ALENext<CR>
nmap <buffer> [d :<C-u>ALEPrevious<CR>
