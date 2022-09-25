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

if dein#is_available('deoplete.nvim') && !dein#is_sourced('deoplete.nvim')
    call dein#source('deoplete.nvim')
endif

if dein#is_sourced('vimtex') && dein#is_sourced('deoplete.nvim')
    call deoplete#custom#source('omni', {
                \'mark':'[omni]',
                \'max_candidates': 6,
                \})
    call deoplete#custom#var('omni', 'input_patterns', {
                \'tex': g:vimtex#re#deoplete
                \})
endif
