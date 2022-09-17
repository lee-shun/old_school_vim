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

Jetpack 'prabirshrestha/asyncomplete.vim'
if(g:old_school_vim_plug_lsp == 1)
    Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
    Jetpack 'andreypopp/asyncomplete-ale.vim'
endif

" ===
" === plugins
" ===
Jetpack 'prabirshrestha/asyncomplete-buffer.vim'
Jetpack 'htlsne/asyncomplete-look'
Jetpack 'prabirshrestha/asyncomplete-file.vim'

if has('win32') || has('win64')
    Jetpack 'kitagry/asyncomplete-tabnine.vim', { 'do': 'powershell.exe .\install.ps1' }
else
    Jetpack 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
endif

if has('python3')&&(g:old_school_vim_plug_advanced == 1)
    Jetpack 'prabirshrestha/asyncomplete-ultisnips.vim'
endif
