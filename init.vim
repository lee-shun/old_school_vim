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
" === path
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ===
" === control the mini and ulti mode
" ===

let g:pure_vim_ulti_mode = 0

" 0: NO plugs at all
" 1: use general plugs
let g:pure_vim_plug_general = 1

" 0: NOT use advanced plugs
" 1: use advanced plugs
let g:pure_vim_plug_advanced = 1

" choose one of the complete front end
let g:pure_vim_plug_deoplete = 1
let g:pure_vim_plug_asyncomplete = 0

" 0: NOT use vim-lsp
" 1: use vim-lsp
let g:pure_vim_plug_lsp = 1


if g:pure_vim_ulti_mode == 0
    let g:pure_vim_plug_general = 0
    let g:pure_vim_plug_advanced = 0
    let g:pure_vim_plug_deoplete = 0
    let g:pure_vim_plug_asyncomplete = 0
    let g:pure_vim_plug_lsp = 0
endif


" ===
" === basic config
" ===
source $CONF_PATH/basic/options.vim
source $CONF_PATH/basic/mappings.vim

if g:pure_vim_ulti_mode == 0
    colorscheme pure_theme
endif

" ===
" === environment
" ===
if g:pure_vim_ulti_mode == 1

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

    " install pynvim for the first time
    if empty(glob($CONF_PATH."/plugged/"))
        if !(executable('pip3'))
            exec "!sudo apt install python3-pip"
            echo("install pip3!")
        endif
        exec "!pip3 install pynvim"
        echo("install pynvim via pip3!")
    endif

endif

" ===
" === plug
" ===
call plug#begin($CONF_PATH.'/plugged')
if g:pure_vim_plug_general == 1
    source $CONF_PATH/plug_general.vim
endif
if g:pure_vim_plug_advanced == 1
    source $CONF_PATH/plug_advanced/plug_language_advanced.vim
endif
if g:pure_vim_plug_deoplete == 1
    source $CONF_PATH/plug_advanced/plug_deoplete.vim
endif
if g:pure_vim_plug_asyncomplete == 1
    source $CONF_PATH/plug_advanced/plug_asyncomplete.vim
endif
if g:pure_vim_plug_lsp == 1
    source $CONF_PATH/plug_advanced/plug_lsp.vim
endif
call plug#end()

" ===
" === plug_settings
" ===
if g:pure_vim_plug_general == 1
    source $CONF_PATH/plug_general_settings.vim
endif
if g:pure_vim_plug_advanced == 1
    source $CONF_PATH/plug_advanced/plug_language_advanced_settings.vim
endif
if g:pure_vim_plug_deoplete == 1
    source $CONF_PATH/plug_advanced/plug_deoplete_settings.vim
endif
if g:pure_vim_plug_asyncomplete == 1
    source $CONF_PATH/plug_advanced/plug_asyncomplete_settings.vim
endif
if g:pure_vim_plug_lsp == 1
    source $CONF_PATH/plug_advanced/plug_lsp_settings.vim
endif

" ===
" === automatic config
" ===
if empty(glob($CONF_PATH."/plugged/")) && g:pure_vim_ulti_mode == 1
    " install font
    if !executable('curl')
        exec "!sudo apt install curl"
    endif
    exec "!bash " . $CONF_PATH . "/font/install_nerd_font.sh"
    " install vim plugins
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    if has('nvim')
        autocmd VimEnter * UpdateRemotePlugins
    endif
endif
