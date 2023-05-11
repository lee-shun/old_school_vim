let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
            \ 'default' : ['path', 'ulti', 'omni', 'incl', 'dict'],
            \ 'vim' : ['path', 'ulti', 'cmd', 'incl', 'dict', 'uspl'],
            \ 'markdown':['path', 'dict'],
            \}
if dein#tap('vim-tabnine-completefunc')
    let g:mucomplete#user_mappings = {
                \'tabnine': "\<C-r>=tabnine#complete()\<CR>",
                \ }
    let g:mucomplete#chains.default = ['path', 'ulti', 'omni', 'incl', 'tabnine', 'dict']
endif
