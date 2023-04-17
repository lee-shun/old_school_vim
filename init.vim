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

" TODO:
" File Explorer. auto find file in fern and vimfiler, speed for defx.

" ===
" === env
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

if !exists("g:os_name")
    if has("win64") || has("win32") || has("win16")
        let g:os_name = "Windows"
        let g:os_architect = 'x86_64'
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

" ===
" === control the modules
" ===
let g:osv_ulti_mode = 1

" use general plugs
let g:osv_plug_general = 1
" use advanced plugs
let g:osv_plug_advanced = 1

" use coc
" NOTE: do NOT use coc on aarch64, compatibility is not good.
let g:osv_plug_coc = 0

" choose one of following complete engines
let g:osv_plug_deoplete = 0
let g:osv_plug_asyncomplete = 1
" vim-lsp as backend of the above frameworks.
let g:osv_plug_lsp = 1

" ===
" === default control
" ===
" don't use any of the plugs if ulti-mode is deactived
if g:osv_ulti_mode == 0
    let g:osv_plug_general = 0
    let g:osv_plug_advanced = 0
    let g:osv_plug_coc = 0
    let g:osv_plug_lsp = 0
    let g:osv_plug_deoplete = 0
    let g:osv_plug_asyncomplete = 0
endif

" don't use coc under aarch64
if g:os_architect == 'aarch64' && g:osv_plug_coc == 1
    let g:osv_plug_coc = 0
    echom " do NOT use coc under " . g:os_architect
endif
" don't use coc with vim under version 8.1-1719
if !has('nvim-0.4') && !has('patch-8.1-1719') && g:osv_plug_coc == 1
    let g:osv_plug_coc = 0
    echom " for coc.nvim: vim>=8.1.1719; nvim>=0.4! "
    echom " you may try asycomplete.vim~ "
endif

" don't use deoplete with vim under version 8.2.1978 or nvim < 0.3
if !has('nvim-0.3') && !has('patch-8.2-1978') && g:osv_plug_deoplete == 1
    let g:osv_plug_deoplete = 0
    echom " for deoplete.nvim: vim>=8.2.1978; nvim>=0.3! "
    echom " you may try asycomplete.vim~ "
endif

" don't use deoplete with vim under version 8.2.1978 or nvim < 0.3
if !has('nvim') && v:version< 800 && g:osv_plug_asyncomplete == 1
    let g:osv_plug_asyncomplete = 0
    echom " for asyncomplete.nvim: vim>=8.0; nvim! "
    echom " you must update your vim or install nvim, if you still want to use the asyncomplete! "
endif

" don't use lsp with vim under version 8.0
if !has('nvim') && v:version< 800 && g:osv_plug_lsp == 1
    let g:osv_plug_lsp = 0
    echom " for vim-lsp: vim>=8.0; nvim! "
    echom " you must update your vim or install nvim, if you still want to use the lsp! "
endif

" ===
" === basic config
" ===
source $CONF_PATH/basic/options.vim
source $CONF_PATH/basic/mappings.vim

" ===
" === colorscheme
" ===
if g:osv_ulti_mode == 0
    set background=dark
    colorscheme seoul256
endif

" ===
" === plug
" ===
if g:osv_ulti_mode == 1

    " the dein version
    if has('nvim')
        if has('nvim-0.8')
            let g:osv_dein_version = 'master'
        elseif has('nvim-0.5')
            let g:osv_dein_version = '3.1'
        elseif has('nvim-0.2')
            let g:osv_dein_version = '2.2'
        else
            let g:osv_dein_version = '1.5'
        endif
    else " vim
        if v:version >= 802
            let g:osv_dein_version = 'master'
        elseif v:version >= 800
            let g:osv_dein_version = '2.2'
        elseif v:version >= 704
            let g:osv_dein_version = '1.5'
        endif
    endif

    let s:dein_dir = $CONF_PATH.'/dein'
    let s:dein_src = $CONF_PATH.'/dein/repos/github.com/Shougo/dein.vim'

    " install dein for the first time
    let g:osv_setup = 0
    if empty(glob(s:dein_dir))
        let g:osv_setup = 1
        exec "!cd ".$CONF_PATH." && git checkout . && git pull && cd -"
        echom "update the old school vim via git!"
        silent exec "!git clone --depth 1 --branch" g:osv_dein_version " https://github.com/Shougo/dein.vim " s:dein_src
        echom "install dein" g:osv_dein_version "to" s:dein_src
    endif
    set runtimepath+=$CONF_PATH/dein/repos/github.com/Shougo/dein.vim

    call dein#begin(s:dein_dir)

    if g:osv_plug_general == 1
        source $CONF_PATH/plug_list/norm/plug_general.vim
        source $CONF_PATH/plug_list/lazy/plug_general.vim
    endif

    if g:osv_plug_advanced == 1
        source $CONF_PATH/plug_list/lazy/plug_advanced.vim
    endif

    if g:osv_plug_coc == 1
        source $CONF_PATH/plug_list/lazy/plug_coc.vim
    endif
    if g:osv_plug_lsp == 1
        source $CONF_PATH/plug_list/lazy/plug_lsp.vim
    endif
    if g:osv_plug_deoplete == 1
        source $CONF_PATH/plug_list/lazy/plug_deoplete.vim
    endif
    if g:osv_plug_asyncomplete == 1
        source $CONF_PATH/plug_list/lazy/plug_asyncomplete.vim
    endif

    call dein#end()

    augroup DeinSetup
        autocmd!
        autocmd VimEnter * call dein#call_hook('post_source')
    augroup END

    if g:osv_setup == 1
        " TODO: git pull the repo
        norm :call dein#install()
        if has('nvim')
            silent execute "UpdateRemotePlugins"
        endif
        echom "install the plugins with dein#update."
    endif

endif

filetype plugin indent on
syntax enable
