call dein#add('dense-analysis/ale', {'lazy':1,
            \'on_event':'BufReadPre',
            \'hook_add':'source $CONF_PATH/plug_conf/ale_conf.vim'})

call dein#add('prabirshrestha/vim-lsp',{'lazy':1,
            \'on_event':'BufReadPre',
            \'hook_source':'source $CONF_PATH/plug_conf/before/vim_lsp_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/vim_lsp_conf.vim',
            \})

call dein#add('rhysd/vim-lsp-ale', {'lazy':1,
            \'depends':['ale', 'vim-lsp'],
            \'on_event':'BufReadPost'})
