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
" === control the mini and ulti mode
" ===
let g:pure_vim_ulti = 1

" ===
" === use the advanced plugins
" ===
let g:pure_vim_plug_advanced = 1
" choose one of the options to use the completion
let g:pure_vim_plug_deoplete = 1
let g:pure_vim_plug_asyncomplete = 0
" use vim-lsp
let g:pure_vim_plug_lsp = 1

"**************************************************************************************************

" ===
" === path & environment
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ulti mode needs to know os name and architecture
if g:pure_vim_ulti == 1
    if !exists("g:os_name")
        if has("win64") || has("win32") || has("win16")
            let g:os_name = "Windows"
        else " not windows, use 'uname' command.
            let g:os_name = substitute(system('uname'), '\n', '', '')
            let g:os_architect =substitute(system('uname -m'), '\n', '', '') 
        endif
    endif
endif

" advanced features need to know python3 path
if g:pure_vim_plug_advanced == 1
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
" === basic config
" ===
source $CONF_PATH/basic.vim

" ===
" === Ulit-mode and Advanced features
" ===
if g:pure_vim_ulti == 1
    " plugs
    call plug#begin($CONF_PATH.'/plugged')
    source $CONF_PATH/plugs.vim
    if g:pure_vim_plug_advanced == 1
        source $CONF_PATH/advanced/plugs_language_advanced.vim
    endif
    if g:pure_vim_plug_deoplete == 1
        source $CONF_PATH/advanced/plug_deoplete.vim
    endif
    if g:pure_vim_plug_asyncomplete == 1
        source $CONF_PATH/advanced/plug_asyncomplete.vim
    endif
    if g:pure_vim_plug_lsp == 1
        source $CONF_PATH/advanced/plug_lsp.vim
    endif
    call plug#end()

    " plugs_settings
    source $CONF_PATH/plugs_settings.vim
    if g:pure_vim_plug_advanced == 1
        source $CONF_PATH/advanced/plugs_language_advanced_settings.vim
    endif
    if g:pure_vim_plug_deoplete == 1
        source $CONF_PATH/advanced/plug_deoplete_settings.vim
    endif
    if g:pure_vim_plug_asyncomplete == 1
        source $CONF_PATH/advanced/plug_asyncomplete_settings.vim
    endif
    if g:pure_vim_plug_lsp == 1
        source $CONF_PATH/advanced/plug_lsp_settings.vim
    endif
endif

" ===
" === Automatic config
" ===
if empty(glob($CONF_PATH."/plugged/"))
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
