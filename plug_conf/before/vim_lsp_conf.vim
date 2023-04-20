" ===
" === vim-lsp
" ===
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_hint = {'text': ''}
let g:lsp_diagnostics_signs_information = {'text': ''}

if has('nvim')
    let g:lsp_diagnostics_virtual_text_prefix = "‣ "
    let g:lsp_diagnostics_virtual_text_enabled = 1
else
    let g:lsp_diagnostics_float_cursor = 0
    let g:lsp_diagnostics_echo_cursor = 1
endif

" use the <c-x><c-o> have the popup menu if just use the vim-lsp
" setlocal omnifunc=lsp#complete
let g:lsp_fold_enabled = 0
