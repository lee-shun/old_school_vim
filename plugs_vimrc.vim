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
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'
Plug 'ryanoasis/vim-devicons'
Plug 'connorholyday/vim-snazzy'
Plug 'ajmwagar/vim-deus'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'

 "general Highlight
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase'  }
Plug 'RRethy/vim-illuminate'

 "general enhancement
Plug 'luochen1990/rainbow'
Plug 'psliwka/vim-smoothie'
" Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Markdown
Plug 'dkarter/bullets.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync()  }, 'for' :['markdown', 'vim-plug']  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown']  }
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'vimwiki/vimwiki'
" Plug 'plasticboy/vim-markdown'
" Plug 'gabrielelana/vim-markdown'
"!!it will change .md to .pandoc file
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'


"C++
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
call plug#end()
