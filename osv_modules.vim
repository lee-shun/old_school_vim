" ===
" === control the modules
" ===
let g:osv_ulti_mode = 1

" use general plugs
let g:osv_plug_general = 1

" some python and filetype-based
let g:osv_plug_advanced = 1

" NOTE: possible value: fzf, leaderF, ctrlp, clap and none. .
" TODO: on aarch-nvim 0.6
" 1. clap shows no providers 
" 2. fzf need ag, rg and bat.
" 3. leaderF needs rg.
" 4. ctrlp needs ag
let g:osv_finder = 'clap'
" NOTE: possible value: fern, defx, vimfiler and none.
let g:osv_file_explorer = 'fern'

" NOTE: possible value: coc, deoplete, asycomplete and none.
let g:osv_complete_engine = 'coc'

" vim-lsp as backend of the above frameworks (Not for coc).
let g:osv_plug_lsp = 0
