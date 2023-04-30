call dein#add('lifepillar/vim-mucomplete', {'lazy':1,
            \'on_event':'InsertEnter',
            \'hook_source':'source $CONF_PATH/plug_conf/before/mucomplete_conf.vim'
            \})
