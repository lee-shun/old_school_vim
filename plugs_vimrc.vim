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

call plug#begin($CONF_PATH.'/plugged')

" ===
" === UI
" ===
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'

" ===
" === File navigation
" ===
Plug 'mhinz/vim-startify'
Plug 'csch0/vim-startify-renderer-nerdfont'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

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

" ===
" === General Enhancement
" ===
Plug 'luochen1990/rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" ===
" === Text object
" ===
Plug 'wellle/targets.vim'

" ===
" === Undo
" ===
Plug 'mbbill/undotree'

" ===
" === Complete
" ===
Plug 'lee-shun/vim-dict'

" ===
" === Git
" ===
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'APZelos/blamer.nvim'

" ===
" === Markdown
" ===
Plug 'SidOfc/mkdx', {'for' :['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync()  }, 'for' :['markdown', 'vim-plug']  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Plug 'lee-shun/vim-markdown-wiki'
Plug 'docunext/closetag.vim', {'for':['markdown', 'html', 'vim-plug']}

" It needs the asyncrun.vim And marp-cli (https://github.com/marp-team/marp-cli)
" On win10, use SumatraPDF (https://www.sumatrapdfreader.org/free-pdf-reader)
" On Linux, use Zathura(maybe...)
" Plug 'skywind3000/asyncrun.vim'
" Plug 'mattf1n/VimMarp' 

" ===
" === Latex
" ===
Plug 'lervag/vimtex'

" ===
" === Translate
" ===
" TODO: This one requires python!
Plug 'voldikss/vim-translator'

call plug#end()
