let s:vimcomplete_conf = {'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre', 'BufNew', 'BufEnter'],
            \'depends':[],
            \'hook_post_source':'source $CONF_PATH/plug_conf/before/vimcomplete_conf.vim',}

if g:osv_snip == 'vsnip'
    call add(s:vimcomplete_conf.depends, 'vim-vsnip')
endif

call dein#add('girishji/vimcomplete',s:vimcomplete_conf)
