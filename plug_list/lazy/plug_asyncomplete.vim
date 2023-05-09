let s:asyncomplete_conf = {'lazy':1,
            \'hook_source':'source $CONF_PATH/plug_conf/before/asyncomplete_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/asyncomplete.vim',
            \'hook_done_update':''}
if has('nvim')
    let s:asyncomplete_conf.hook_done_update = 'UpdateRemotePlugins'
endif
call dein#add('prabirshrestha/asyncomplete.vim', s:asyncomplete_conf)

" ===
" === sources
" ===
call dein#add('prabirshrestha/asyncomplete-buffer.vim', {'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'depends':'asyncomplete.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/buffer.vim',
            \})

if executable('look')
    call dein#add('htlsne/asyncomplete-look', {'lazy':1,
                \'on_event': ['BufNewFile', 'BufReadPre'],
                \'depends':'asyncomplete.vim',
                \'hook_source':"let g:asc_look_good_words_file = $CONF_PATH.'/spell/en.utf-8.add'",
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/look.vim',
                \})
endif

call dein#add('prabirshrestha/asyncomplete-file.vim', {'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'depends':'asyncomplete.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/file.vim',
            \})

call dein#add('prabirshrestha/asyncomplete-emoji.vim', {'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'depends':'asyncomplete.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/emoji.vim',
            \})

" tabnine
if g:os_architect != 'aarch64'
    if g:os_name == 'Linux'
        call dein#add('kitagry/asyncomplete-tabnine.vim', { 'lazy':1,
                    \'on_event': ['BufNewFile', 'BufReadPre'],
                    \'depends':'asyncomplete.vim',
                    \'build': './install.sh',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/tabnine.vim',
                    \})
    elseif g:os_name == 'Windows'
        call dein#add('kitagry/asyncomplete-tabnine.vim', { 'lazy':1,
                    \'on_event': ['BufNewFile', 'BufReadPre'],
                    \'depends':'asyncomplete.vim',
                    \'build': 'powershell.exe .\install.ps1',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/tabnine.vim',
                    \})
    endif
endif

" snip
if has('python3') && dein#tap('ultisnips')
    call dein#add('prabirshrestha/asyncomplete-ultisnips.vim', {'lazy':1,
                \'on_event': ['BufNewFile', 'BufReadPre'],
                \'depends':'asyncomplete.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/snippest.vim',
                \})
endif

" lsp
if g:osv_vim_lsp == 1
    call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'lazy':1,
                \'on_event': ['BufNewFile', 'BufReadPre'],
                \'depends':'asyncomplete.vim',
                \})
    call dein#add('andreypopp/asyncomplete-ale.vim', {'lazy':1,
                \'on_event': ['BufNewFile', 'BufReadPre'],
                \'depends':'asyncomplete.vim',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete/ale.vim',
                \})
endif
