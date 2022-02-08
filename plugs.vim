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
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'
Plug 'voldikss/vim-floaterm'

" ===
" === File navigation
" ===
Plug 'mhinz/vim-startify'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'

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
Plug 'godlygeek/tabular'
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

" ===
" === Undo
" ===
Plug 'mbbill/undotree'

" ===
" === keywords
" ===
Plug 'lee-shun/vim-dict'

" ===
" === Git
" ===
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
if has('nvim') || has('popupwin')
    Plug 'APZelos/blamer.nvim'
endif

" ===
" === Markdown
" ===
if (g:os_name == 'Linux' && g:os_architect == 'x86_64') || (g:os_name == 'Windows')
    " only Linux_x86_64, Windows have this plugin
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync()  }, 'for' :['markdown', 'vim-plug']  }
endif

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Plug 'lee-shun/vim-markdown-wiki'

" ===
" === Latex
" ===
if executable('latexmk')
    Plug 'lervag/vimtex'
endif

" ===
" === ros
" ===
if (g:os_name == 'Linux') && (executable('roscore'))
    Plug 'taketwo/vim-ros'
endif
