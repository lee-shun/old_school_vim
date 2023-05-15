let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
            \ 'default' : ['path', 'ulti', 'incl', 'dict'],
            \ 'vim' : ['path', 'ulti', 'omni', 'cmd', 'incl', 'dict'],
            \ 'cpp':['path', 'ulti', 'omni', 'dict'],
            \ 'c':['path', 'ulti', 'omni', 'dict'],
            \ 'python':['path', 'ulti', 'omni', 'dict'],
            \ 'markdown':['path', 'dict'],
            \}
