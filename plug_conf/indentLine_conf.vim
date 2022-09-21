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
" === indentLine
" ===
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_bgcolor_term = 237
let g:indentLine_leadingSpaceChar = '·'
augroup auto_indentline_ft
    autocmd!
    autocmd FileType vim IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType tex IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType cpp IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType c IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType python IndentLinesEnable | LeadingSpaceEnable
augroup END

