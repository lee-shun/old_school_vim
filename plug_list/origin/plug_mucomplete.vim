let s:mucomplete_config = {'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'depends':[],
            \'hook_source':'source $CONF_PATH/plug_conf/before/mucomplete_conf.vim'
            \}

call dein#add('lifepillar/vim-mucomplete', s:mucomplete_config)
