" vim-lsp + ale
let g:ale_linters = {
            \'python': ['vim-lsp', 'pylint'],
            \'cpp': ['vim-lsp', 'cpplint'],
            \'markdown':['markdownlint']}
