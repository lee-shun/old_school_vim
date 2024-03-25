call dein#add('girishji/vimcomplete',{'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vimcomplete_conf.vim',
            \})
