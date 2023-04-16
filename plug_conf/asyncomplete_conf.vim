"*******************************************************************************
"                                                                              "
"          .oOOOo.   o      o       .oOOOo.         o                 o        "
"         .O     o. O      O        o     o        O                 O         "
"         O       o o      o        O.             o                 o         "
"         o       O O      o         `OOoo.        O                 O         "
"         O       o o  .oOoO              `O .oOo  OoOo. .oOo. .oOo. o         "
"         o       O O  o   O               o O     o   o O   o O   o O         "
"         `o     O' o  O   o        O.    .O o     o   O o   O o   O o         "
"          `OoooO'  Oo `OoO'o        `oooO'  `OoO' O   o `OoO' `OoO' Oo        "
"                                                                              "
"  Author : lee-shun                                                           "
"                                                                              "
"  Email  : 2015097272@qq.com                                                  "
"                                                                              "
"*******************************************************************************

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

" ale
if dein#tap('asyncomplete-ale.vim')
    call asyncomplete#ale#register_source({
                \ 'name': 'reason',
                \ 'linter': 'flow',
                \ })
endif

" tabnine
if dein#tap('asyncomplete-tabnine.vim')
    call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
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
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                \ 'name': 'ultisnips',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                \ }))
endif

call asyncomplete#force_refresh()
