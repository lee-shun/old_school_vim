" ===
" === lightline with lsp + ale
" ===
let g:lightline = {
            \ 'colorscheme': g:colors_name,
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'active': {
            \ 'left': [ [ 'mode', 'paste' ],
            \ [ 'readonly', 'filename', 'modified' ],
            \ [ 'gitbranch', 'gitdiff']],
            \ 'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename' ] ],
            \   'right': [ [ 'filetype' ] ] },
            \ 'component_function': {
            \ 'gitbranch': 'FugitiveHead',
            \ },
            \ 'component_expand': {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_infos': 'lightline#ale#infos',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \  'gitdiff': 'lightline#gitdiff#get',
            \ },
            \ 'component_type': {
            \  'linter_checking': 'right',
            \  'linter_infos': 'right',
            \  'linter_warnings': 'warning',
            \  'linter_errors': 'error',
            \  'linter_ok': 'right',
            \ }
            \ }

