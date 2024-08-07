call dein#add('neoclide/coc.nvim', { 'lazy':'1',
            \'depends':g:osv_snip=='coc-snippets' ? 'vim-snippets' : [],
            \'on_event': ['BufNewFile', 'BufReadPre', 'BufNew', 'BufEnter'],
            \'merged': 0,
            \'rev': 'release',
            \'hook_source':'source $CONF_PATH/plug_conf/before/coc_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_conf.vim'})
