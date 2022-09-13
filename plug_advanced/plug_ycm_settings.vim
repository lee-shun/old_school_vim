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

let g:ycm_clangd_binary_path = "clangd"
let g:ycm_enable_semantic_highlighting=1

nnoremap gd :YcmCompleter GoToDefinition<CR>
nnoremap gr :YcmCompleter GoToReference<CR>
nnoremap gi :YcmCompleter GoToImplementation<CR>

nnoremap gt :YcmCompleter GetType<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename<space>
nnoremap <leader>ca :YcmCompleter FixIt<CR>
nnoremap K :YcmCompleter GetDoc<CR>
