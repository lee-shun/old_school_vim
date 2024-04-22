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
" === env check
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ===
" === read the custom_modules.vim
" ===
let g:osv_debug = 1
let g:osv_daily_update = 0
let g:osv_repo_source = "origin"
let g:osv_plug_general = 0
let g:osv_plug_advanced = 0
let g:osv_snip = 'none'
let g:osv_finder = 'none'
let g:osv_file_explorer = 'none'
let g:osv_complete_engine = 'none'
let g:osv_linter = 'none'
let g:osv_lsp = 'none'
let g:osv_ai = 'none'

" customs
if empty(glob($CONF_PATH.'/custom_modules.vim'))
    " generate the custom_modules if it doesn't exist.
    call osv_ultis#system#exec("cp -r ".$CONF_PATH."/template/custom_modules.vim.template ".$CONF_PATH."/custom_modules.vim")
    call osv_ultis#msg#info("you may want to define your own modules in ".$CONF_PATH."/custom_modules.vim later on.")
    call input("press any key to continue...")
else
    source $CONF_PATH/custom_modules.vim
endif

" check if no web-plugins are used
if g:osv_plug_general == 0
            \ && g:osv_plug_advanced == 0
            \ && g:osv_snip == 'none'
            \ && g:osv_finder == 'none'
            \ && g:osv_file_explorer == 'none'
            \ && g:osv_complete_engine == 'none'
            \ && g:osv_linter == 'none'
            \ && g:osv_lsp == 'none'
            \ && g:osv_ai == 'none'
    let s:osv_use_web_plug = 0
else
    let s:osv_use_web_plug = 1
endif

" ===
" === check the base env
" ===
if s:osv_use_web_plug
    if !osv_ultis#check_env#check_vim_ver(704) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#warn('OSV needs nvim >= 0.4.0 or vim >= 7.4 to use the web plug!')
        let s:osv_use_web_plug = 0
        let g:osv_plug_general = 0
        let g:osv_plug_advanced = 0
        let g:osv_snip = 'none'
        let g:osv_finder = 'none'
        let g:osv_file_explorer = 'none'
        let g:osv_complete_engine = 'none'
        let g:osv_linter = 'none'
        let g:osv_lsp = 'none'
        let g:osv_ai = 'none'
    endif
endif

if !exists("g:os_name")
    if has("win64") || has("win32") || has("win16")
        let g:os_name = "Windows"
        let g:os_architect = 'x86_64'
    else " not windows, use 'uname' command.
        let g:os_name = substitute(system('uname'), '\n', '', '')
        let g:os_architect =substitute(system('uname -m'), '\n', '', '')
    endif
endif

if executable('conda')
    if g:os_name == 'Windows' && has('nvim') " nvim on win
        let g:python3_host_prog='C:\ProgramData\Anaconda3\python.exe'
    elseif g:os_name == 'Linux'
        let g:python_host_prog='/usr/bin/python'
        let g:python3_host_prog='/usr/bin/python3'
    endif
endif

" for popupwin
if has('nvim')
    let g:osv_has_popup_win = has('nvim-0.4.0')
else
    let g:osv_has_popup_win = has('popupwin')
endif

" for popup
if has('nvim')
    let g:osv_has_popup = has('nvim-0.4.0')
else
    let g:osv_has_popup = exists('*popup_create')
endif

if s:osv_use_web_plug
    source $CONF_PATH/plug_list/plug_check.vim
endif

" ===
" === basic config
" ===
source $CONF_PATH/basic/options.vim
source $CONF_PATH/basic/mappings.vim

" ===
" === plug
" ===
if s:osv_use_web_plug
    source $CONF_PATH/plug_list/plug_init.vim
else
    source $CONF_PATH/local_plug_list/local_plug_init.vim
endif
    source $CONF_PATH/local_plug_list/local_plug_init.vim

filetype plugin indent on
syntax enable
