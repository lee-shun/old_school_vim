"**************************************************************************************************
"
"       ___          ___          ___          ___                  ___                   ___
"      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
"     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
"    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
"   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
"  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
"  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
"       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
"        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
"                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
"                   \/__/        \|__|        \/__/                                      \/__/
"
"  Author : lee-shun
"
"  Email  : 2015097272@qq.com
"
"**************************************************************************************************


" ===
" === UI
" ===
Plug 'lambdalisue/nerdfont.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'RRethy/vim-illuminate'
Plug 'voldikss/vim-floaterm'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'dracula/vim'

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
let g:pure_vim_plug_file_finder_ctrlp = 0
let g:pure_vim_plug_file_finder_leaderf = 1

if g:pure_vim_plug_file_finder_ctrlp == 1
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'ludovicchabant/vim-ctrlp-autoignore'
elseif g:pure_vim_plug_file_finder_leaderf == 1
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
endif

" ===
" === General Highlight
" ===
Plug 'chrisbra/Colorizer'
Plug 'sakshamgupta05/vim-todo-highlight'

" ===
" === General Enhancement
" ===
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-speeddating'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug '907th/vim-auto-save'
Plug 'romainl/vim-cool'

" ===
" === Fold
" ===
Plug 'lambdalisue/readablefold.vim'

" ===
" === Text object
" ===
Plug 'wellle/targets.vim'

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
