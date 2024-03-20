let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
            \ 'default' : ['path', 'ulti', 'vsnip', 'incl', 'dict'],
            \ 'vim' : ['path', 'ulti', 'vsnip','omni', 'cmd', 'incl', 'dict'],
            \ 'cpp':['path', 'ulti', 'vsnip','omni', 'dict'],
            \ 'c':['path', 'ulti', 'vsnip','omni', 'dict'],
            \ 'python':['path', 'ulti','vsnip', 'omni', 'dict'],
            \ 'markdown':['path','vsnip', 'dict'],
            \}
