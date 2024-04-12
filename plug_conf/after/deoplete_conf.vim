" ===
" === map for cr
" ===
imap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

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
if dein#tap('deoplete-tabnine')
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
if dein#tap('vim-lsp')
    call deoplete#custom#source('lsp', {
                \'max_candidates': 10,
                \'mark':"[lsp]",
                \})
endif

if dein#tap('vim-lsc')
    call deoplete#custom#source('lsc', {
                \'max_candidates': 10,
                \'mark':"[lsc]",
                \})
endif

" ale
if dein#tap('ale')
    call deoplete#custom#source('ale', {
                \'max_candidates': 10,
                \'mark':"[ale]",
                \'rank': 999,
                \})
endif

" already make sure the vimtex is sourced, double check.
if dein#is_sourced('vimtex')
    call deoplete#custom#source('omni', {
                \'mark':'[omni]',
                \'max_candidates': 6,
                \})
    call deoplete#custom#var('omni', 'input_patterns', {
                \'tex': g:vimtex#re#deoplete
                \})
endif
