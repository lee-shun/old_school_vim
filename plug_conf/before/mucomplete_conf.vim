let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
            \ 'default' : ['path', 'ulti', 'incl', 'dict'],
            \ 'vim' : ['path', 'ulti', 'cmd', 'incl', 'dict'],
            \ 'cpp':['path', 'ulti', 'omni', 'dict'],
            \ 'c':['path', 'ulti', 'omni', 'dict'],
            \ 'python':['path', 'ulti', 'omni', 'dict'],
            \ 'markdown':['path', 'dict'],
            \}

if dein#tap('vim-tabnine-completefunc')
    let g:mucomplete#user_mappings = {
                \'tabnine': "\<C-r>=tabnine#complete()\<CR>",
                \ }
    let g:mucomplete#chains.default = ['path', 'ulti', 'incl', 'tabnine', 'dict']
    let g:mucomplete#chains.markdown = ['path', 'dict', 'tabnine']
endif
