call dein#add('old_school_vim/vimcomplete',{'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vimcomplete_conf.vim',
            \})
