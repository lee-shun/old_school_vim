call dein#add('roxma/nvim-yarp', {'lazy':1})
call dein#add('roxma/vim-hug-neovim-rpc',{'lazy':1})

" ===
" === deoplete plugins
" ===
call dein#add('tbodt/deoplete-tabnine', { 'lazy':1,
            \'build': './install.sh',})

call dein#add('lighttiger2505/deoplete-vim-lsp',{'lazy':1})

call dein#add('Shougo/deoplete.nvim',{'lazy':1,
            \'depends':['nvim-yarp','vim-hug-neovim-rpc','deoplete-tabnine', 'deoplete-vim-lsp'],
            \'on_event': 'InsertEnter',
            \'hook_add':'let g:deoplete#enable_at_startup = 1 ',
            \'hook_post_source':'source $CONF_PATH/plug_conf/deoplete_conf.vim' })
