" call dein#add('neoclide/coc.nvim', { 'lazy':'1',
"             \'depends':['vim-snippets'],
"             \'on_event': ['BufReadPre'],
"             \'merged': 0,
"             \'rev': 'release',
"             \'hook_source':'source $CONF_PATH/plug_conf/before/coc_conf.vim',
"             \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_conf.vim'})

call dein#add('https://gitee.com/zsdfbb/coc.nvim.git', { 'lazy':'1',
            \'depends':['vim-snippets'],
            \'on_event': ['BufReadPre'],
            \'merged': 0,
            \'rev': 'release',
            \'hook_source':'source $CONF_PATH/plug_conf/before/coc_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_conf.vim'})
