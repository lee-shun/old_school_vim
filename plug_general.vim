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
Jetpack 'luochen1990/rainbow'
Jetpack 'Yggdroot/indentLine'
Jetpack 'RRethy/vim-illuminate'
Jetpack 'voldikss/vim-floaterm'

" ===
" === File navigation
" ===
Jetpack 'mhinz/vim-startify'
Jetpack 'csch0/vim-startify-renderer-nerdfont'
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
Jetpack 'chrisbra/Colorizer'
Jetpack 'sakshamgupta05/vim-todo-highlight'

" ===
" === General Enhancement
" ===
Jetpack 'junegunn/vim-peekaboo'
Jetpack 'tpope/vim-speeddating'
Jetpack 'junegunn/vim-easy-align'
Jetpack 'mg979/vim-visual-multi', {'branch': 'master'}
Jetpack '907th/vim-auto-save'

" ===
" === Fold
" ===
Jetpack 'lambdalisue/readablefold.vim'

" ===
" === Text object
" ===
Jetpack 'wellle/targets.vim'
Jetpack 'kana/vim-textobj-user'
Jetpack 'thinca/vim-textobj-between'

" ===
" === Undo
" ===
Jetpack 'mbbill/undotree'

" ===
" === Async
" ===
Jetpack 'skywind3000/asyncrun.vim'
Jetpack 'skywind3000/asynctasks.vim'

" ===
" === Git
" ===
Jetpack 'rhysd/conflict-marker.vim'
Jetpack 'tpope/vim-fugitive'
Jetpack 'mhinz/vim-signify'
if has('nvim') || has('popupwin')
    Jetpack 'APZelos/blamer.nvim'
endif
