call dein#add('neoclide/coc.nvim', { 'lazy':'1',
            \'depends':['vim-snippets'],
            \'on_event': ['BufReadPre'],
            \'merged': 0,
            \'rev': 'release',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_conf.vim'})

call dein#add('antoinemadec/coc-fzf', {'lazy':1,
            \'depends':['coc.nvim', 'fzf.vim'],
            \'on_event': ['BufReadPre'],
            \'rev': 'release',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_fzf_conf.vim'})
