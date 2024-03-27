if g:osv_ai == 'none'
    finish
endif

if g:osv_ai == 'codeium'
    call dein#add('old_school_vim/codeium.vim', {'lazy':1,
                \'on_event' :['BufEnter'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/codeium_conf.vim'
                \})
endif
