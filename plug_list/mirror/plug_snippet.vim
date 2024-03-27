if g:osv_snip == 'none'
    finish
endif

call dein#add('old_school_vim/vim-snippets', {'lazy':1,
            \'on_event':'InsertEnter'
            \})

if g:osv_snip == 'ultisnips'
    call dein#add('old_school_vim/ultisnips', {'lazy':1,
                \'depends':['vim-snippets'],
                \'on_event':'InsertEnter',
                \'hook_source':'source $CONF_PATH/plug_conf/before/snippets_conf.vim'
                \})
endif
