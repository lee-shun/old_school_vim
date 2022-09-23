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

" ===
" === map for TAB
" ===
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()
inoremap <silent><expr> <S-TAB>
            \ pumvisible() ? "\<C-p>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()

" ===
" === map for cr
" ===
imap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" overrall
call deoplete#custom#option({
            \ 'auto_complete_delay': 5,
            \ 'smart_case': v:true,
            \ })
" file
call deoplete#custom#source('file', {
            \'mark':'[file]',
            \'max_candidates': 4
            \})
call deoplete#custom#var('file', {
            \'enable_slash_completion':1})

" around
call deoplete#custom#source('around',{
            \'mark':'[arou]',
            \'max_candidates': 4
            \})

" buffer
call deoplete#custom#source('buffer', {
            \'mark':'[buff]',
            \'max_candidates': 4
            \})

" dictionary
call deoplete#custom#source('dictionary', {
            \'mark':'[dict]',
            \'min_pattern_length': 4,
            \'sorters': [],
            \'max_candidates': 4
            \})

" tabnine
if dein#is_available('deoplete-tabnine')
    call deoplete#custom#var('tabnine', {
                \'line_limit': 500,
                \'max_num_results': 4,
                \})
    call deoplete#custom#source('tabnine', {
                \'mark':'[tabn]',
                \'max_candidates': 4,
                \})
endif

" lsp
if dein#is_available('vim-lsp')
    call deoplete#custom#source('lsp', {
                \'max_candidates': 10,
                \'mark':"[lsp]",
                \})
endif

" ale
if dein#is_available('ale')
    call deoplete#custom#source('ale', {
                \'max_candidates': 10,
                \'mark':"[ale]",
                \'rank': 999,
                \})
endif
