" ===
" === control the modules
" ===
let g:osv_ulti_mode = 1

" use general plugs
let g:osv_plug_general = 1
" NOTE: possible value: fzf, leaderF, ctrlp and none.
let g:osv_finder = 'fzf'
" NOTE: possible value: fern, defx, vimfiler, nerdtree and none.
let g:osv_file_explorer = 'fern'

" use advanced plugs
let g:osv_plug_advanced = 1

" NOTE: possible value: coc, deoplete, asycomplete and none.
let g:osv_complete_engine = 'asyncomplete'

" vim-lsp as backend of the above frameworks (Not for coc).
let g:osv_plug_lsp = 1
