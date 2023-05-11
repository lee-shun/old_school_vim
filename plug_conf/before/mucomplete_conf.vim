let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
            \ 'default' : ['path', 'ulti', 'omni', 'incl', 'dict'],
            \ 'vim' : ['path', 'ulti', 'cmd', 'incl', 'dict', 'uspl'],
            \ 'markdown':['path', 'dict'],
            \}
