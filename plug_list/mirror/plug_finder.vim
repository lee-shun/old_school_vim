if g:osv_finder == 'none' || g:osv_finder == 'coc-lists'
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
        call dein#add('lee-shun/fzf', {'lazy':1,
                    \'build': './install --all',
                    \})
    elseif g:os_name == 'Windows'
        call dein#add('lee-shun/fzf', {'lazy':1,
                    \'build': 'powershell.exe .\install.ps1',
                    \})
    endif
    call add(s:fzf_vim_config.depends, 'fzf')

    if dein#tap('vim-templates')
        call add(s:fzf_vim_config.depends, 'vim-templates')
    endif

    if g:osv_complete_engine == 'coc'
        call dein#add('lee-shun/coc-fzf', {'lazy':1,
                    \'rev': 'release',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/coc_fzf_conf.vim'
                    \})
        call add(s:fzf_vim_config.depends, 'coc-fzf')
    endif

    call dein#add('lee-shun/fzf.vim', s:fzf_vim_config)

elseif g:osv_finder == 'leaderf'

    let s:leaderf_config = {'lazy':1,
                \'depends': [],
                \'on_map':{'n':'<leader>f'},
                \'on_cmd':'Leaderf',
                \'hook_done_update':'LeaderfInstallCExtension',
                \'hook_source':'source $CONF_PATH/plug_conf/before/leaderf_conf.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/leaderf_conf.vim'
                \}
    if dein#tap('ultisnips')
        call dein#add('lee-shun/Leaderf-snippet', {'lazy':1,
                    \'depends':['ultisnips'],
                    \})
        call add(s:leaderf_config.depends, 'Leaderf-snippet')
    endif

    call dein#add('lee-shun/LeaderF', s:leaderf_config)

elseif g:osv_finder == 'ctrlp'

    call dein#add('lee-shun/ctrlp-funky', {'lazy':1,
                \'depends':'ctrlp.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/funky.vim',
                \})
    call dein#add('lee-shun/vim-ctrlp-autoignore', {'lazy':1,
                \'depends':'ctrlp.vim',
                \})
    call dein#add('lee-shun/ctrlp-location-list', {'lazy':1,
                \'depends':'ctrlp.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/location_list.vim',
                \})
    call dein#add('lee-shun/ctrlp-extensions.vim', {'lazy':1,
                \'depends':'ctrlp.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/extensions.vim',
                \})
    call dein#add('lee-shun/ctrlp-register', {'lazy':1,
                \'depends':'ctrlp.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/register.vim',
                \})
    " will be sourced after the ctrlp.vim
    let g:ctrlp_plugins = ['ctrlp-funky', 'vim-ctrlp-autoignore', 'ctrlp-location-list', 'ctrlp-extensions.vim', 'ctrlp-register',]

    if executable('ag')
        call dein#add('lee-shun/vim-ctrlp-ag', {'lazy':1,
                    \'depends':'ctrlp.vim',
                    \'hook_source':'source $CONF_PATH/plug_conf/before/ctrlp/ag.vim',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/ag.vim',
                    \})
        call add(g:ctrlp_plugins, 'vim-ctrlp-ag')
    endif

    call dein#add('lee-shun/ctrlp.vim', {'lazy':1,
                \'depends':g:ctrlp_plugins,
                \'on_map':{'n':'<leader>f'},
                \'on_cmd':['CtrlP'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/ctrlp/ctrlp.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/ctrlp.vim '
                \})

elseif g:osv_finder == 'clap'
    let s:clap_config = {'lazy':1,
                \'build':'',
                \'on_cmd':'Clap',
                \'on_map':'<leader>f',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/clap_conf.vim',
                \}
    if g:os_name == 'Linux'
        let s:clap_config.build = './install.sh'
    elseif g:os_name == 'Windows'
        let s:clap_config.build = 'powershell.exe .\install.ps1'
    endif
    call dein#add('liuchengxu/vim-clap', s:clap_config)
endif
