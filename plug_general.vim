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
" === UI
" ===
Jetpack 'lambdalisue/nerdfont.vim'
Jetpack 'ryanoasis/vim-devicons'
Jetpack 'itchyny/lightline.vim'
Jetpack 'niklaas/lightline-gitdiff'
Jetpack 'luochen1990/rainbow', {'event':'BufReadPost'}
Jetpack 'Yggdroot/indentLine'
Jetpack 'RRethy/vim-illuminate', {'event':'BufReadPost'}
Jetpack 'voldikss/vim-floaterm', {'event':'BufReadPost'}

" ===
" === File navigation
" ===
" TODO: use other file manager
Jetpack 'mhinz/vim-startify'
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
Jetpack 'lambdalisue/fern.vim', {'branch':'main'}
Jetpack 'lambdalisue/fern-git-status.vim'
Jetpack 'airblade/vim-rooter'

" ===
" === File Finder
" ===
Jetpack 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" ===
" === General Highlight
" ===
Jetpack 'chrisbra/Colorizer', {'event':'BufReadPost'}
Jetpack 'sakshamgupta05/vim-todo-highlight', {'event':'BufReadPost'}

" ===
" === General Enhancement
" ===
Jetpack 'junegunn/vim-peekaboo', {'event':'BufReadPost'}
Jetpack 'tpope/vim-speeddating', {'event':'BufReadPost'}
Jetpack 'junegunn/vim-easy-align', {'event':'BufReadPost'}
Jetpack 'mg979/vim-visual-multi', {'branch': 'master', 'event':'BufReadPost'}
Jetpack '907th/vim-auto-save', {'event':'BufReadPost'}

" ===
" === Fold
" ===
Jetpack 'lambdalisue/readablefold.vim', {'event':'BufReadPost'}

" ===
" === Text object
" ===
Jetpack 'wellle/targets.vim', {'event':'BufReadPost'}
Jetpack 'kana/vim-textobj-user', {'event':'BufReadPost'}
Jetpack 'thinca/vim-textobj-between', {'event':'BufReadPost'}

" ===
" === Undo
" ===
Jetpack 'mbbill/undotree', {'event':'BufReadPost'}

" ===
" === Async
" ===
Jetpack 'skywind3000/asyncrun.vim', {'event':'BufReadPost'}
Jetpack 'skywind3000/asynctasks.vim', {'event':'BufReadPost'}

" ===
" === Git
" ===
Jetpack 'rhysd/conflict-marker.vim', {'event':'BufReadPost'}
Jetpack 'tpope/vim-fugitive', {'event':'BufReadPost'}
Jetpack 'mhinz/vim-signify', {'event':'BufReadPost'}
if has('nvim') || has('popupwin')
    Jetpack 'APZelos/blamer.nvim', {'event':'BufReadPost'}
endif
