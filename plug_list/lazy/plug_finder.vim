if g:osv_finder == 'none'
    finish
elseif g:osv_finder == 'fzf'

    let s:fzf_vim_config = {'lazy':1,
                \'depends': [],
                \'on_map':{'n':'<leader>f'},
                \'on_cmd' : [ 'FZF', 'Files', 'GFiles', 'Buffers', 'Colors', 'Ag', 'Rg', 'Lines', 'BLines', 'Tags', 'BTags', 'Marks', 'Windows', 'Locate', 'History', 'Snippets', 'Commits', 'BCommits', 'Commands', 'Maps', 'Helptags', 'Filetypes' ],
                \'hook_source':'source $CONF_PATH/plug_conf/before/fzf_conf.vim',
                \'hook_post_source' : 'source $CONF_PATH/plug_conf/after/fzf_conf.vim'
                \}

    if g:os_name == 'Linux'
        call dein#add('junegunn/fzf', {'lazy':1,
                    \'build': './install --all',
                    \})
    elseif g:os_name == 'Windows'
        call dein#add('junegunn/fzf', {'lazy':1,
                    \'build': 'powershell.exe .\install.ps1',
                    \})
    endif
    call add(s:fzf_vim_config.depends, 'fzf')

    call dein#add('tibabit/vim-templates', {'lazy':1,
                \'hook_source':'source $CONF_PATH/plug_conf/before/templates_conf.vim',
                \'hook_post_source' : 'source $CONF_PATH/plug_conf/after/templates_conf.vim',
                \})
    call add(s:fzf_vim_config.depends, 'vim-templates')

    if g:osv_complete_engine == 'coc'
        call dein#add('antoinemadec/coc-fzf', {'lazy':1,
                    \'rev': 'release',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_fzf_conf.vim'
                    \})
    call add(s:fzf_vim_config.depends, 'coc-fzf')
    endif

    call dein#add('junegunn/fzf.vim', s:fzf_vim_config)

elseif g:osv_finder == 'leaderF'

elseif g:osv_finder == 'ctrlp'

    call dein#add('tacahiroy/ctrlp-funky', {'lazy':1,
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp_funky_conf.vim',
                \})
    call dein#add('ludovicchabant/vim-ctrlp-autoignore', {'lazy':1
                \})
    call dein#add('lee-shun/ctrlp-location-list', {'lazy':1,
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp_location_list_conf.vim',
                \})
    call dein#add('sgur/ctrlp-extensions.vim', {'lazy':1,
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp_extensions_conf.vim',
                \})
    call dein#add('mattn/ctrlp-register', {'lazy':1,
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp_register_conf.vim',
                \})

    let s:ctrlp_config = {'lazy':1,
                \'depends': ['ctrp-funky', 'vim-ctrlp-autoignore', 'ctrlp-location-list', 'ctrlp-extensions.vim', 'ctrlp-register'],
                \'on_map':{'n':'<leader>f'},
                \'on_cmd':['CtrlP'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/ctrlp_conf.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp_conf.vim'
                \}

    call dein#add('lokikl/vim-ctrlp-ag', {'lazy':1,
                \'hook_source':'source $CONF_PATH/plug_conf/before/ctrlp_ag_conf.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp_ag_conf.vim',
                \})
    call add(s:ctrlp_config.depends, 'vim-ctrlp-ag')


    call dein#add('ctrlpvim/ctrlp.vim', s:ctrlp_config)

endif
