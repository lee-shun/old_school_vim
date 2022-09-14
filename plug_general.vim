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
Plug 'lambdalisue/nerdfont.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'niklaas/lightline-gitdiff'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'RRethy/vim-illuminate'
Plug 'voldikss/vim-floaterm'

" ===
" === File navigation
" ===
Plug 'mhinz/vim-startify'
Plug 'csch0/vim-startify-renderer-nerdfont'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern.vim', {'branch':'main'}
Plug 'lambdalisue/fern-git-status.vim'
Plug 'airblade/vim-rooter'

" ===
" === File Finder
" ===
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" ===
" === General Highlight
" ===
Plug 'chrisbra/Colorizer'
Plug 'sakshamgupta05/vim-todo-highlight'

" ===
" === General Enhancement
" ===
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-speeddating'
Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug '907th/vim-auto-save'

" ===
" === Fold
" ===
Plug 'lambdalisue/readablefold.vim'

" ===
" === Text object
" ===
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'

" ===
" === Undo
" ===
Plug 'mbbill/undotree'

" ===
" === Async
" ===
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" ===
" === Git
" ===
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
if has('nvim') || has('popupwin')
    Plug 'APZelos/blamer.nvim'
endif
