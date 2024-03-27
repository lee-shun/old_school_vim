let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
            \ 'default' : ['path', 'incl', 'dict'],
            \ 'vim' : ['path', 'omni', 'cmd', 'incl', 'dict'],
            \ 'cpp':['path', 'omni', 'dict'],
            \ 'c':['path', 'omni', 'dict'],
            \ 'python':['path', 'omni', 'dict'],
            \ 'markdown':['path', 'dict'],
            \}



if g:osv_snip == 'ultisnips'
    let g:mucomplete#chains = {
                \ 'default' : ['path','ulti', 'incl', 'dict'],
                \ 'vim' : ['path', 'ulti','omni', 'cmd', 'incl', 'dict'],
                \ 'cpp':['path', 'ulti','omni', 'dict'],
                \ 'c':['path', 'ulti','omni', 'dict'],
                \ 'python':['path', 'ulti','omni', 'dict'],
                \ 'markdown':['path', 'ulti','dict'],
                \}
elseif g:osv_snip == 'vsnip'
    let g:mucomplete#chains = {
                \ 'default' : ['path','vsnip', 'incl', 'dict'],
                \ 'vim' : ['path', 'vsnip','omni', 'cmd', 'incl', 'dict'],
                \ 'cpp':['path', 'vsnip','omni', 'dict'],
                \ 'c':['path', 'vsnip','omni', 'dict'],
                \ 'python':['path', 'vsnip','omni', 'dict'],
                \ 'markdown':['path', 'vsnip','dict'],
                \}
endif
