let s:mucomplete_config = {'lazy':1,
            \'on_event':'InsertEnter',
            \'depends':[],
            \'hook_source':'source $CONF_PATH/plug_conf/before/mucomplete_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/mucomplete_conf.vim'
            \}

call dein#add('old_school_vim/vim-mucomplete', s:mucomplete_config)
