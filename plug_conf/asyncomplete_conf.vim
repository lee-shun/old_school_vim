let g:asyncomplete_auto_popup = 1

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" buffer
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'allowlist': ['*'],
            \ 'blocklist': ['go'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \    'max_buffer_size': 5000000,
            \   'max_num_result': 4,
            \  },
            \ }))

" look
let g:asc_look_good_words_file = $CONF_PATH.'/spell/en.utf-8.add'
call asyncomplete#register_source({
            \ 'name': 'look',
            \ 'allowlist': ['text', 'markdown'],
            \ 'completor': function('asyncomplete#sources#look#completor'),
            \ })

" file
call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'allowlist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))

" tabnine
call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
            \ 'name': 'tabnine',
            \ 'allowlist': ['*'],
            \ 'completor': function('asyncomplete#sources#tabnine#completor'),
            \ 'config': {
            \   'line_limit': 1000,
            \   'max_num_result': 4,
            \  },
            \ }))

" snippest
if has('python3')
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                \ 'name': 'ultisnips',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                \ }))
endif

call asyncomplete#force_refresh()
