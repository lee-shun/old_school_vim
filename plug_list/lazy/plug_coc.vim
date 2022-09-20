call dein#add('neoclide/coc.nvim', { 'lazy':'1',
            \'depends':['vim-snippets'],
            \'merged': 0,
            \'rev': 'release',
            \'hook_post_source':'source $CONF_PATH/plug_conf/coc_conf.vim'})

call dein#add('josa42/vim-lightline-coc', {'lazy':1,
            \'depends':['lightline.vim', 'coc.nvim'],
            \'on_event': ['BufReadPre'], 
            \'hook_add':'source $CONF_PATH/plug_conf/lightline_coc_conf.vim',
            \'hook_post_source':'call lightline#coc#register() | call lightline#init()'})
