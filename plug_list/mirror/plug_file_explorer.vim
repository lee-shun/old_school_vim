if g:osv_file_explorer == 'none' || g:osv_file_explorer == 'coc-explorer'
    finish
elseif g:osv_file_explorer == 'defx'
    call dein#add('old_school_vim/defx-git', {'lazy':1,
                \'hook_source':'source $CONF_PATH/plug_conf/before/defx_git_config.vim'})
    call dein#add('old_school_vim/defx-icons', {'lazy':1,
                \'depends':['vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/defx_icons_conf.vim'})
    let s:defx_nvim_config = {'lazy':1,
                \'on_cmd':'Defx',
                \'on_map':'<leader>t',
                \'depends':['nvim-yarp', 'vim-hug-neovim-rpc', 'defx-git', 'defx-icons'],
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/defx_conf.vim',
                \'hook_done_update': ''}
    if has('nvim')
        let s:defx_nvim_config.hook_done_update = 'UpdateRemotePlugins'
    endif
    call dein#add('old_school_vim/defx.nvim', s:defx_nvim_config)
elseif g:osv_file_explorer == 'fern'
    call dein#add('old_school_vim/nerdfont.vim', {'lazy':1,
                \})
    call dein#add('old_school_vim/fern-renderer-nerdfont.vim', {'lazy':1,
                \'depends':['nerdfont.vim'],
                \})
    call dein#add('old_school_vim/fern-hijack.vim', {'lazy':1,
                \})
    call dein#add('old_school_vim/fern-git-status.vim', {'lazy':1,
                \})
    call dein#add('old_school_vim/fern.vim', {'lazy':1,
                \'on_map':'<leader>t',
                \'on_cmd':'Fern',
                \'depends':['fern-renderer-nerdfont.vim', 'fern-hijack.vim', 'fern-git-status.vim'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/fern_conf.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/fern_conf.vim'})
elseif g:osv_file_explorer == 'vimfiler'
    call dein#add('old_school_vim/unite.vim', {'lazy':1,
                \})
    call dein#add('old_school_vim/vimfiler.vim', {'lazy':1,
                \'on_map':'<leader>t',
                \'on_cmd':'VimFiler',
                \'depends':['unite.vim', 'vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/vimfiler_conf.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/vimfiler_conf.vim'})
endif
