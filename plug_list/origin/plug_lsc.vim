call dein#add('natebosch/vim-lsc', { 'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre', 'BufNew', 'BufEnter'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vim_lsc_conf.vim'
            \})
