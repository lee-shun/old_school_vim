call dein#add('dense-analysis/ale', {'lazy':1,
            \'on_event':'BufReadPre',
            \'hook_add':'source $CONF_PATH/plug_conf/ale_conf.vim'})

call dein#add('prabirshrestha/vim-lsp',{'lazy':1,
            \'on_event':'BufReadPre',
            \'hook_add':'source $CONF_PATH/plug_conf/vim_lsp_conf.vim',
            \})

call dein#add('rhysd/vim-lsp-ale', {'lazy':1,
            \'depends':['ale', 'vim-lsp'],
            \'on_event':'BufReadPost'})
