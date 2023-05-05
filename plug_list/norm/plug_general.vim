call dein#add('Shougo/dein.vim', {
            \'rev':g:osv_dein_version,
            \})

if has('nvim') && !has('nvim-0.8')
    call dein#add('antoinemadec/FixCursorHold.nvim')
endif

call dein#add('ryanoasis/vim-devicons')

if g:osv_finder == 'none' || g:osv_finder == 'coc-lists' || v:version < 800
    call dein#add('mhinz/vim-startify', {
                \'depends':'[vim-devicons]',
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_startify_conf.vim',
                \})
else
    let s:vim_dashboard_config = {
                \'depends':'[vim-devicons]',
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_dashboard_conf.vim',
                \}
    call dein#add('lee-shun/vim-dashboard', s:vim_dashboard_config)
endif
