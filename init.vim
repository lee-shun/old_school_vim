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
" === path
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ===
" === control the mode
" ===
let g:old_school_vim_ulti_mode = 1

" use general plugs
let g:old_school_vim_plug_general = 1
" use advanced plugs
let g:old_school_vim_plug_advanced = 1

" choose one of following complete engines
let g:old_school_vim_plug_deoplete = 1
let g:old_school_vim_plug_asyncomplete = 0
" use the ycm
let g:old_school_vim_plug_ycm = 0

let g:old_school_vim_plug_lsp = 1 " vim-lsp as backend of the above frameworks.

" don't use any of the plugs if ulti-mode is deactived
if g:old_school_vim_ulti_mode == 0
    let g:old_school_vim_plug_general = 0
    let g:old_school_vim_plug_advanced = 0
    let g:old_school_vim_plug_deoplete = 0
    let g:old_school_vim_plug_asyncomplete = 0
    let g:old_school_vim_plug_lsp = 0
endif

" ===
" === environment
" ===
if g:old_school_vim_ulti_mode == 1

    if !exists("g:os_name")
        if has("win64") || has("win32") || has("win16")
            let g:os_name = "Windows"
        else " not windows, use 'uname' command.
            let g:os_name = substitute(system('uname'), '\n', '', '')
            let g:os_architect =substitute(system('uname -m'), '\n', '', '')
        endif
    endif

    if g:os_name == 'Windows' && has('nvim') " nvim on win
        let g:python3_host_prog='C:\ProgramData\Anaconda3\python.exe'
    elseif g:os_name == 'Linux'
        if executable('conda')
            let g:python_host_prog='/usr/bin/python'
            let g:python3_host_prog='python'
        else
            let g:python_host_prog='/usr/bin/python'
            let g:python3_host_prog='/usr/bin/python3'
        endif
    endif

endif

" ===
" === automatic config
" ===
if empty(glob($CONF_PATH."/pack/")) && g:old_school_vim_ulti_mode == 1
    if has('nvim')
        let s:jetpackfile = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
        let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
        if !filereadable(s:jetpackfile)
            call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
        endif
    else
        let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
        let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
        if !filereadable(s:jetpackfile)
            call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
        endif
    endif

    " install vim plugins
    autocmd VimEnter * JetpackSync | source $MYVIMRC

    if has('nvim')
        autocmd VimEnter * UpdateRemotePlugins
    endif
endif

" ===
" === basic config
" ===
source $CONF_PATH/basic/options.vim
source $CONF_PATH/basic/mappings.vim

" ===
" === plug
" ===
packadd vim-jetpack

call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1}

if g:old_school_vim_plug_general == 1
    source $CONF_PATH/plug_general.vim
endif
if g:old_school_vim_plug_advanced == 1
    source $CONF_PATH/plug_advanced/plug_advanced.vim
endif
if g:old_school_vim_plug_deoplete == 1
    source $CONF_PATH/plug_advanced/plug_deoplete.vim
endif
if g:old_school_vim_plug_asyncomplete == 1
    source $CONF_PATH/plug_advanced/plug_asyncomplete.vim
endif
if g:old_school_vim_plug_ycm == 1
    source $CONF_PATH/plug_advanced/plug_ycm.vim
endif
if g:old_school_vim_plug_lsp == 1
    source $CONF_PATH/plug_advanced/plug_lsp.vim
endif
call jetpack#end()

" ===
" === plug_settings
" ===
if g:old_school_vim_plug_general == 1
    source $CONF_PATH/plug_general_settings.vim
endif
if g:old_school_vim_plug_advanced == 1
    source $CONF_PATH/plug_advanced/plug_advanced_settings.vim
endif
if g:old_school_vim_plug_deoplete == 1
    source $CONF_PATH/plug_advanced/plug_deoplete_settings.vim
endif
if g:old_school_vim_plug_asyncomplete == 1
    source $CONF_PATH/plug_advanced/plug_asyncomplete_settings.vim
endif
if g:old_school_vim_plug_ycm == 1
    source $CONF_PATH/plug_advanced/plug_ycm_settings.vim
endif
if g:old_school_vim_plug_lsp == 1
    source $CONF_PATH/plug_advanced/plug_lsp_settings.vim
endif
