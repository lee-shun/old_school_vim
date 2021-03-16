"**************************************************************************************************
"    __  __        __     _____ __  __ ____   ____
"   |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"   | |\/| | | | |  \ \ / / | || |\/| | |_) | |
"   | |  | | |_| |   \ V /  | || |  | |  _ <| |___
"   |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"           |___/
"
"
"File   : plugs_vimrc
"
"Author : lee-shun
"
"Email  : 2015097272@qq.com
"
"**************************************************************************************************

call plug#begin('~/.vim/plugged')

"===
"===Pretty Dress
"===
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'
Plug 'ryanoasis/vim-devicons'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'sainnhe/sonokai'

"===
"===File navigation
"===
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'

"===
"===general Highlight
"===
Plug 'sheerun/vim-polyglot'

"===
"===general enhancement
"===
Plug 'luochen1990/rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'machakann/vim-highlightedyank'


"===
"===git
"===
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"===
"===Markdown
"===
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync()  }, 'for' :['markdown', 'vim-plug']  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown']  }
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'

call plug#end()
