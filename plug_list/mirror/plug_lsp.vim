call dein#add('lee-shun/vim-lsp',{'lazy':1,
            \'on_event':['BufReadPre','BufNewFile'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vim_lsp_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/vim_lsp_conf.vim',
            \})

if g:osv_linter == 'ale'
    call dein#add('lee-shun/vim-lsp-ale', {'lazy':1,
                \'depends':['ale', 'vim-lsp'],
                \'on_event':['BufReadPre','BufNewFile'],
                \})
endif
