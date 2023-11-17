let s:lcn_config = { 'lazy':1,
            \'on_event':['BufReadPost', 'BufNewFile'],
            \'depends':[],
            \'rev':'next',
            \'build':'bash install.sh',
            \'hook_source':'source $CONF_PATH/plug_conf/before/lcn_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/lcn_conf.vim',
            \}

if g:osv_finder == 'fzf'
    call add(s:lcn_config.depends, 'fzf.vim')
endif

call dein#add('lee-shun/LanguageClient-neovim', s:lcn_config)
