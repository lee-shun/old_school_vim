call dein#add('Shougo/dein.vim', {
            \'rev':g:osv_dein_version,
            \})

call dein#add('arcticicestudio/nord-vim', {
            \'hook_post_source':'source $CONF_PATH/plug_conf/color_conf.vim'
            \})

call dein#add('ryanoasis/vim-devicons')

if has('nvim') || v:version > 800
    call dein#add('roxma/vim-hug-neovim-rpc')
    call dein#add('roxma/nvim-yarp', {
                \'depends':'vim-hug-neovim-rpc'
                \})
endif

if has('nvim') && !has('nvim-0.8')
    call dein#add('antoinemadec/FixCursorHold.nvim')
endif

call dein#add('mhinz/vim-startify')
