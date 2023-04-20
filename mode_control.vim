" ===
" === control the modules
" ===
let g:osv_ulti_mode = 1

" use general plugs
let g:osv_plug_general = 1
" use advanced plugs
let g:osv_plug_advanced = 1

" use coc
" NOTE: do NOT use coc on aarch64, compatibility is not good.
let g:osv_plug_coc = 0

" choose one of following complete engines
let g:osv_plug_deoplete = 0
let g:osv_plug_asyncomplete = 1

" vim-lsp as backend of the above frameworks.
let g:osv_plug_lsp = 1
