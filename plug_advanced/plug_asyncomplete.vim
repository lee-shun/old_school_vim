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

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" ===
" === plugins
" ===
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'htlsne/asyncomplete-look'
Plug 'high-moctane/asyncomplete-nextword.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

if has('win32') || has('win64')
    Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': 'powershell.exe .\install.ps1' }
else
    Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
endif

if has('python3')
    Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif
