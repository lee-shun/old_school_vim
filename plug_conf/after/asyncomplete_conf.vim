" buffer
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'allowlist': ['*'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \    'max_buffer_size': 5000000,
            \   'max_num_result': 4,
            \  },
            \ }))

" look
let g:asc_look_good_words_file = $CONF_PATH.'/spell/en.utf-8.add'
au User asyncomplete_setup call asyncomplete#register_source({
            \ 'name': 'look',
            \ 'allowlist': ['text', 'markdown', 'tex'],
            \ 'completor': function('asyncomplete#sources#look#completor'),
            \ })

" file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'allowlist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))

" emoji
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
            \ 'name': 'emoji',
            \ 'allowlist': ['markdown'],
            \ 'completor': function('asyncomplete#sources#emoji#completor'),
            \ }))

" ale
if dein#tap('asyncomplete-ale.vim')
    au User asyncomplete_setup  call asyncomplete#ale#register_source({
                \ 'name': 'ale',
                \ 'linter': 'flow',
                \ })
endif

" tabnine
if dein#tap('asyncomplete-tabnine.vim')
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
                \ 'name': 'tabnine',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#tabnine#completor'),
                \ 'config': {
                \   'line_limit': 1000,
                \   'max_num_result': 4,
                \  },
                \ }))
endif

" snippest
if dein#tap('asyncomplete-ultisnips.vim')
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                \ 'name': 'ultisnips',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                \ }))
endif

call asyncomplete#force_refresh()
