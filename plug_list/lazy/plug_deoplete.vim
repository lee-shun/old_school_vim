call dein#add('roxma/nvim-yarp', {'lazy':1})
call dein#add('roxma/vim-hug-neovim-rpc',{'lazy':1})
call dein#add('Shougo/deoplete.nvim',{'lazy':1,
            \'depends':['nvim-yarp','vim-hug-neovim-rpc'],
            \'on_event': 'InsertEnter',
            \'hook_add':'let g:deoplete#enable_at_startup = 1 ',
            \'hook_post_source':'source $CONF_PATH/plug_conf/deoplete_conf.vim' })

