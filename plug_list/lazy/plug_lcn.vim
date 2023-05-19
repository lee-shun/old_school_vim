call dein#add("autozimu/LanguageClient-neovim", { 'lazy':1,
            \'on_event':['BufReadPost', 'BufNewFile'],
            \'rev':'next',
            \'build':'bash install.sh',
            \'hook_source':'source $CONF_PATH/plug_conf/before/lcn_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/lcn_conf.vim',
            \})
