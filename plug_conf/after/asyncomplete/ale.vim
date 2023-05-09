" ale
if dein#tap('asyncomplete-ale.vim')
    call asyncomplete#ale#register_source({
                \ 'name': 'ale',
                \ 'linter': 'flow',
                \ })
endif
