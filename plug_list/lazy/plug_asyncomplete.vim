if dein#is_available('vim-lsp')
    call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'lazy':1,
                \})
endif
call dein#add( 'prabirshrestha/asyncomplete-buffer.vim', {'lazy':1,
            \})
call dein#add( 'htlsne/asyncomplete-look', {'lazy':1,
            \})
call dein#add( 'prabirshrestha/asyncomplete-file.vim', {'lazy':1,
            \})
if has('win32') || has('win64')
    call dein#add( 'kitagry/asyncomplete-tabnine.vim', { 'lazy':1,
                \'build': 'powershell.exe .\install.ps1' })
else
    call dein#add( 'kitagry/asyncomplete-tabnine.vim', { 'lazy':1,
                \'build': './install.sh' })
endif

if has('python3') && dein#is_available('ultisnips')
    call dein#add( 'prabirshrestha/asyncomplete-ultisnips.vim', {'lazy':1,
                \})
endif

call dein#add('prabirshrestha/asyncomplete.vim', {'lazy':1,
            \'depends': ['asyncomplete-lsp.vim','asyncomplete-buffer.vim', 'asyncomplete-look',
            \'asyncomplete-file.vim', 'asyncomplete-tabnine.vim', 'asyncomplete-ultisnips.vim'],
            \'on_event': ['BufReadPre'],
            \'hook_post_source':'source $CONF_PATH/plug_conf/asyncomplete_conf.vim' })