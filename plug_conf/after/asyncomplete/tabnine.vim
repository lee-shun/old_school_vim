" tabnine
if dein#tap('asyncomplete-tabnine.vim')
    call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
                \ 'name': 'tabnine',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#tabnine#completor'),
                \ 'config': {
                \   'line_limit': 1000,
                \   'max_num_result': 5,
                \  },
                \ }))
endif
