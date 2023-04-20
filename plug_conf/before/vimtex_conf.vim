" ===
" === vimtex
" ===
if g:os_name == 'Windows'
  let g:vimtex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_view_general_options
      \ = '-reuse-instance -forward-search @tex @line @pdf'
else
    let g:vimtex_view_method = 'zathura'
endif

let g:vimtex_quickfix_mode = 0
let g:vimtex_mappings_enabled=0
let g:vimtex_imaps_enabled=0
let g:vimtex_text_obj_enabled=0
let g:vimtex_fold_enabled=1
let g:tex_conceal='abdmg'
let g:vimtex_format_enabled=1
