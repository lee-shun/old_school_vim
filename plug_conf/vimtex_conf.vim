" ===
" === vimtex
" ===
let g:vimtex_mappings_enabled=0
let g:vimtex_imaps_enabled=0
let g:vimtex_text_obj_enabled=0
let g:vimtex_fold_enabled=1
let g:tex_flavor='latex'
if has('win32')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
else
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_format_enabled=1

