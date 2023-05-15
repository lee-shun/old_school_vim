function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" ===
" === sources
" ===

" buffer
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'allowlist': ['*'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \    'max_buffer_size': 5000000,
            \   'max_num_result': 5,
            \  },
            \ }))

" emoji
call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
            \ 'name': 'emoji',
            \ 'allowlist': ['markdown'],
            \ 'completor': function('asyncomplete#sources#emoji#completor'),
            \ }))

" file
call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'allowlist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))

" look
if dein#tap('asyncomplete-look.vim')
    call asyncomplete#register_source({
                \ 'name': 'look',
                \ 'allowlist': ['text', 'markdown', 'tex'],
                \ 'completor': function('asyncomplete#sources#look#completor'),
                \ })
endif

"  snippest
if dein#tap('asyncomplete-ultisnips.vim')
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                \ 'name': 'ultisnips',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                \ }))
endif

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

" ale
if dein#tap('asyncomplete-ale.vim')
    call asyncomplete#ale#register_source({
                \ 'name': 'ale',
                \ 'linter': 'flow',
                \ })
endif

" NOTE: vim-lsp will be registered automatically.

call asyncomplete#enable_for_buffer()
