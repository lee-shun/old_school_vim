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
" === deoplete (works well with the omnifunc in vim)
" ===
if has('nvim')
    Jetpack 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
else
    Jetpack 'Shougo/deoplete.nvim'
    Jetpack 'roxma/nvim-yarp'
    Jetpack 'roxma/vim-hug-neovim-rpc'
endif

" ===
" === deoplete plugins
" ===
if g:os_name == 'Windows'
    Jetpack 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1'}
    Jetpack 'deoplete-plugins/deoplete-jedi'
elseif g:os_name == 'Linux'&&g:os_architect =='x86_64'
    Jetpack 'tbodt/deoplete-tabnine', { 'do': './install.sh'}
    if(g:old_school_vim_plug_lsp == 1)
        Jetpack 'lighttiger2505/deoplete-vim-lsp'
    endif
endif
