let s:mucomplete_config = {'lazy':1,
            \'on_event':'InsertEnter',
            \'depends':[],
            \'hook_source':'source $CONF_PATH/plug_conf/before/mucomplete_conf.vim'
            \}

" tabnine
if g:os_architect != 'aarch64'
    if g:os_name == 'Linux'
        call dein#add('lee-shun/vim-tabnine-completefunc', {'lazy':1,
                    \'build': './install.sh',
                    \})
    elseif g:os_name == 'Windows'
        call dein#add('lee-shun/vim-tabnine-completefunc', {'lazy':1,
                    \'build': 'powershell.exe .\install.ps1',
                    \})
    endif
    call add(s:mucomplete_config.depends, 'vim-tabnine-completefunc')
endif

call dein#add('lifepillar/vim-mucomplete', s:mucomplete_config)

