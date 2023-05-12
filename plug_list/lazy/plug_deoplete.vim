" ===
" === deoplete plugins
" ===
call dein#add('deoplete-plugins/deoplete-dictionary', {'lazy': 1})

if g:os_architect != 'aarch64'
    if g:os_name == 'Linux'
        call dein#add('tbodt/deoplete-tabnine', { 'lazy':1,
                    \'build': './install.sh',})
    elseif g:os_name == 'Windows'
        call dein#add('tbodt/deoplete-tabnine', { 'lazy':1,
                    \'build': 'powershell.exe .\install.ps1' })
    endif
endif

let s:deoplete_nvim_config = {'lazy':1,
            \'depends':['nvim-yarp','vim-hug-neovim-rpc','deoplete-dictionary']
            \'on_event': ['BufReadPre'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/deoplete_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/deoplete_conf.vim',
            \'hook_done_update':''}

if dein#tap('ultisnips')
    call add(s:deoplete_nvim_config.depends, 'ultisnips')
endif

if g:osv_lsp == 'vim-lsp'
    call dein#add('lighttiger2505/deoplete-vim-lsp',{'lazy':1})
    call add(s:deoplete_nvim_config.depends, 'deoplete-vim-lsp')
endif
if g:osv_lsp == 'vim-lsc'
    call dein#add('hrsh7th/deoplete-vim-lsc',{'lazy':1})
    call add(s:deoplete_nvim_config.depends, 'deoplete-vim-lsc')
endif

if dein#tap('deoplete-tabnine')
    call add(s:deoplete_nvim_config.depends, 'deoplete-tabnine')
endif

" as a complete source
if g:osv_linter == 'ale'
    call add(s:deoplete_nvim_config.depends, 'ale')
endif

if has('nvim')
    let s:deoplete_nvim_config.hook_done_update = 'UpdateRemotePlugins'
endif

call dein#add('Shougo/deoplete.nvim', s:deoplete_nvim_config)
