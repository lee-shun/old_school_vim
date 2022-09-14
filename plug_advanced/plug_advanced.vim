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
Jetpack 'voldikss/vim-translator'

" ===
" === Snippets
" ===
if has('python3')
    Jetpack 'SirVer/ultisnips'
    Jetpack 'honza/vim-snippets'
endif

" ===
" === code format
" ===
Jetpack 'sbdchd/neoformat'

" ===
" === Markdown
" ===
if (g:os_name == 'Linux' && g:os_architect == 'x86_64') || (g:os_name == 'Windows')
    " only Linux_x86_64, Windows have this plugin
    Jetpack 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync()  }, 'for' :['markdown', 'vim-plug']  }
endif
Jetpack 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Jetpack 'lee-shun/vim-markdown-wiki'
Jetpack 'ferrine/md-img-paste.vim'

" ===
" === Latex
" ===
Jetpack 'lervag/vimtex'

" ===
" === ros
" ===
if (g:os_name == 'Linux') && (executable('roscore'))
    Jetpack 'taketwo/vim-ros', { 'for' : 'rosmsg', 'on':'Roscd'}
endif

" ===
" === other files
" ===
Jetpack 'edersonferreira/open.vim'
