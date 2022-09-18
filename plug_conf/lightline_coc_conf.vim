let g:lightline = {
            \ 'colorscheme': g:colors_name,
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'active': {
            \ 'left': [ [ 'mode', 'paste' ],
            \ [ 'readonly', 'filename', 'modified' ],
            \ [ 'gitbranch', 'gitdiff'],
            \],
            \ 'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ],
            \  ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename' ] ],
            \   'right': [ [ 'filetype' ] ] },
            \ 'component_function': {
            \ 'gitbranch': 'FugitiveHead',
            \ },
            \ 'component_expand': {
            \   'gitdiff': 'lightline#gitdiff#get',
            \ },
            \ 'component_type': {
            \   'gitdiff': 'middle',
            \ },
            \ }
