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
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'RRethy/vim-illuminate'
Plug 'voldikss/vim-floaterm'
Plug 'kyoz/purify', { 'rtp': 'vim' }

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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'ludovicchabant/vim-ctrlp-autoignore'

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
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
" === keywords
" ===
Plug 'lee-shun/vim-dict'
Plug 'junegunn/vim-emoji'

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
