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
" === env
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

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

" ===
" === control the mode
" ===
let g:old_school_vim_ulti_mode = 1

" use general plugs
let g:old_school_vim_plug_general = 1
" use advanced plugs
let g:old_school_vim_plug_advanced = 1

" use coc
" NOTE: do NOT use coc on aarch64, compatibility is not good.
let g:old_school_vim_plug_coc = 0

" vim-lsp as backend of the above frameworks.
let g:old_school_vim_plug_lsp = 1

" choose one of following complete engines
let g:old_school_vim_plug_deoplete = 1
let g:old_school_vim_plug_asyncomplete = 0

" ===
" === default control
" ===
" don't use any of the plugs if ulti-mode is deactived
if g:old_school_vim_ulti_mode == 0
    let g:old_school_vim_plug_general = 0
    let g:old_school_vim_plug_advanced = 0
    let g:old_school_vim_plug_coc = 0
    let g:old_school_vim_plug_lsp = 0
    let g:old_school_vim_plug_deoplete = 0
    let g:old_school_vim_plug_asyncomplete = 0
endif

" don't use coc under aarch64
if g:os_architect == 'aarch64' && g:old_school_vim_plug_coc == 1
    let g:old_school_vim_plug_coc = 0
    echom " do NOT use coc under " . g:os_architect
endif

" ===
" === basic config
" ===
source $CONF_PATH/basic/options.vim
source $CONF_PATH/basic/mappings.vim

" ===
" === colorscheme
" ===
if g:old_school_vim_ulti_mode == 0
    set background=dark
    colorscheme seoul256
endif

" ===
" === plug
" ===
if g:old_school_vim_ulti_mode == 1

    set runtimepath+=$CONF_PATH/dein/repos/github.com/Shougo/dein.vim
    let s:dein_dir = $CONF_PATH."/dein"
    let s:norm_plug_dir = $CONF_PATH.'/plug_list/norm'
    let s:lazy_plug_dir = $CONF_PATH.'/plug_list/lazy'

    if dein#load_state(s:dein_dir)

    call dein#begin(s:dein_dir)

    if g:old_school_vim_plug_general == 1
        source $CONF_PATH/plug_list/norm/plug_general.vim
        source $CONF_PATH/plug_list/lazy/plug_general.vim
    endif

    if g:old_school_vim_plug_advanced == 1
        source $CONF_PATH/plug_list/lazy/plug_advanced.vim
    endif

    if g:old_school_vim_plug_coc == 1
        source $CONF_PATH/plug_list/lazy/plug_coc.vim
    endif
    if g:old_school_vim_plug_lsp == 1
        source $CONF_PATH/plug_list/lazy/plug_lsp.vim
    endif
    if g:old_school_vim_plug_deoplete == 1
        source $CONF_PATH/plug_list/lazy/plug_deoplete.vim
    endif
    if g:old_school_vim_plug_asyncomplete == 1
        source $CONF_PATH/plug_list/lazy/plug_asyncomplete.vim
    endif

    call dein#end()
    call dein#save_state()
    endif

    augroup DeinSetup
        autocmd!
        autocmd VimEnter * call dein#call_hook('post_source')
    augroup END

endif

filetype plugin indent on
syntax enable
