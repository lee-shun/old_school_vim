let s:asyncomplete_conf = {'lazy':1,
            \'depends':[],
            \'on_event': ['BufNewFile', 'BufReadPre'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/asyncomplete_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/asyncomplete.vim',
            \'hook_done_update':''}
if has('nvim')
    let s:asyncomplete_conf.hook_done_update = 'UpdateRemotePlugins'
endif

" ===
" === sources
" ===
call dein#add('prabirshrestha/asyncomplete-buffer.vim', {'lazy':1,
            \})
call add(s:asyncomplete_conf.depends, 'asyncomplete-buffer.vim')
call dein#add('prabirshrestha/asyncomplete-file.vim', {'lazy':1,
            \})
call add(s:asyncomplete_conf.depends, 'asyncomplete-file.vim')
call dein#add('prabirshrestha/asyncomplete-emoji.vim', {'lazy':1,
            \})
call add(s:asyncomplete_conf.depends, 'asyncomplete-emoji.vim')

if executable('look')
    call dein#add('htlsne/asyncomplete-look', {'lazy':1,
                \'hook_source':"let g:asc_look_good_words_file = $CONF_PATH.'/spell/en.utf-8.add'",
                \})
    call add(s:asyncomplete_conf.depends, 'asyncomplete-look')
endif

" tabnine
if g:os_architect != 'aarch64'
    if g:os_name == 'Linux'
        call dein#add('lee-shun/asyncomplete-tabnine.vim', { 'lazy':1,
                    \'build': './install.sh',
                    \})
        call add(s:asyncomplete_conf.depends, 'asyncomplete-tabnine.vim')
    elseif g:os_name == 'Windows'
        call dein#add('lee-shun/asyncomplete-tabnine.vim', { 'lazy':1,
                    \'build': 'powershell.exe .\install.ps1',
                    \})
        call add(s:asyncomplete_conf.depends, 'asyncomplete-tabnine.vim')
    endif
endif

" snip
if has('python3') && dein#tap('ultisnips')
    call dein#add('prabirshrestha/asyncomplete-ultisnips.vim', {'lazy':1,
                \})
    call add(s:asyncomplete_conf.depends, 'asyncomplete-ultisnips.vim')
endif

" linter
if g:osv_linter == 'ale'
    call dein#add('andreypopp/asyncomplete-ale.vim', {'lazy':1,
                \})
    call add(s:asyncomplete_conf.depends, 'asyncomplete-ale.vim')
endif

" lsp
if g:osv_lsp == 'vim-lsp'
    call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'lazy':1,
                \})
    call add(s:asyncomplete_conf.depends, 'asyncomplete-lsp.vim')
elseif g:osv_lsp == 'vim-lsc' || g:osv_lsp == 'lcn'
    " use omni function to help the lsc
    call dein#add('yami-beta/asyncomplete-omni.vim', {'lazy':1
                \})
    call add(s:asyncomplete_conf.depends, 'asyncomplete-omni.vim')
endif

call dein#add('prabirshrestha/asyncomplete.vim', s:asyncomplete_conf)
