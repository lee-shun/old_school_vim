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
                \'hook_source' : 'source $CONF_PATH/plug_conf/before/templates_conf.vim',
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

endif
