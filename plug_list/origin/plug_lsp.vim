let s:vim_lsp_conf = {'lazy':1,
            \'on_event':['BufReadPre','BufNewFile'],
            \'depends':[],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vim_lsp_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/vim_lsp_conf.vim',
            \}

call dein#add('prabirshrestha/vim-lsp',s:vim_lsp_conf)

if g:osv_linter == 'ale'
    call dein#add('rhysd/vim-lsp-ale', {'lazy':1,
                \'depends':['ale', 'vim-lsp'],
                \'on_event':['BufReadPre','BufNewFile'],
                \})
endif
