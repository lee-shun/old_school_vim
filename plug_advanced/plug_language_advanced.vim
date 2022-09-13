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
" === Translate
" ===
Plug 'voldikss/vim-translator'

" ===
" === Snippets
" ===
if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
endif

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
    Plug 'taketwo/vim-ros', { 'for' : 'rosmsg', 'on':'Roscd'}
endif

" ===
" === other files
" ===
Plug 'edersonferreira/open.vim'
