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
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'

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
" === Complete
" ===
Plug 'lee-shun/vim-dict'

if g:os_name == 'Linux' || g:os_name == 'Windows'
    " only Linux, Windows have this plugin

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    Plug 'Shougo/deoplete-clangx'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'Shougo/neopairs.vim'

    if g:os_name == 'Windows'
        Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
    elseif g:os_name == 'Linux'&&g:os_architect =='x86_64'
        Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    endif

endif


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
if (g:os_name == 'Linux'&& g:os_architect == 'x86_64') || (g:os_name == 'Windows')

    " only Linux_x86_64, Windows have this plugin
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync()  }, 'for' :['markdown', 'vim-plug']  }

endif

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Plug 'lee-shun/vim-markdown-wiki'

" ===
" === Latex
" ===
Plug 'lervag/vimtex'

" ===
" === Translate
" ===
Plug 'voldikss/vim-translator'

" ===
" === python
" ===
if g:os_name == 'Linux'&&has('nvim')
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
endif

call plug#end()
