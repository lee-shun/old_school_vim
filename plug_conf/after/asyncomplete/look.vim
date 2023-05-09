" look
if dein#tap('asyncomplete-look.vim')
    call asyncomplete#register_source({
                \ 'name': 'look',
                \ 'allowlist': ['text', 'markdown', 'tex'],
                \ 'completor': function('asyncomplete#sources#look#completor'),
                \ })
endif
