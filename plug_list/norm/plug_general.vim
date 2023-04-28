call dein#add('Shougo/dein.vim', {
            \'rev':g:osv_dein_version,
            \})

call dein#add('joshdick/onedark.vim', {
            \'hook_post_source':'colorscheme onedark'
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

if g:osv_finder != 'none'
    let s:vim_dashboard_config = {
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_dashboard_conf.vim',
                \}
    call dein#add('lee-shun/vim-dashboard', s:vim_dashboard_config)
else
    call dein#add('mhinz/vim-startify')
endif
