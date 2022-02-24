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
" === Translate
" ===
Plug 'voldikss/vim-translator'

" ===
" === Snippets
" ===
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ===
" === code format
" ===
Plug 'sbdchd/neoformat'

" ===
" === python
" ===
if g:os_name == 'Linux' && has('nvim')
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
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
Plug 'ferrine/md-img-paste.vim'

" ===
" === Latex
" ===
Plug 'lervag/vimtex'

" ===
" === ros
" ===
if (g:os_name == 'Linux') && (executable('roscore'))
    Plug 'taketwo/vim-ros'
endif

" ===
" === other files
" ===
Plug 'edersonferreira/open.vim'
