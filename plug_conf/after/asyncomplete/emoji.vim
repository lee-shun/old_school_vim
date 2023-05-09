" emoji
call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
            \ 'name': 'emoji',
            \ 'allowlist': ['markdown'],
            \ 'completor': function('asyncomplete#sources#emoji#completor'),
            \ }))

