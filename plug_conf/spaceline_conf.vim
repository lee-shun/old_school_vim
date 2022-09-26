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

let g:spaceline_colorscheme = 'nord'
let g:spaceline_seperate_style = 'arrow-fade'
let g:spaceline_diagnostic_errorsign = ' '
let g:spaceline_diagnostic_warnsign = ' '
let g:spaceline_git_branch_icon = ' '
let g:spaceline_custom_diff_icon =  [' ',' ',' ']

let g:spaceline_diff_tool = 'vim-signify'

if g:old_school_vim_plug_lsp == 1
    let g:spaceline_diagnostic_tool = 'ale'
elseif g:old_school_vim_plug_coc == 1
    let g:spaceline_diagnostic_tool = 'coc'
endif

