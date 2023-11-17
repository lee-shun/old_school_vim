call dein#add('old_school_vim/ale', {'lazy':1,
            \'on_event':['BufReadPre','BufNewFile'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/ale_conf.vim'
            \})
