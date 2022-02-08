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

" TODO: if I have an Apple Mac, there will be some different in the system
" identification 'if-esle', however, I probably never want to spend that much
" money until I'm rich. :)

" ===
" === path
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ===
" === control the mini and ulti mode
" ===
let g:pure_vim_ulti = 1

" ===  ulti mode needs to know os name
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

" ===
" === use the completion plugins
" ===
let g:pure_vim_advanced = 1

" === advanced features need to know python path
if g:pure_vim_advanced == 1

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

    " === install pynvim for the first time
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
    " === plugs
    call plug#begin($CONF_PATH.'/plugged')
    source $CONF_PATH/plugs.vim
    if g:pure_vim_advanced == 1
        source $CONF_PATH/plugs_advanced.vim
    endif
    call plug#end()

    " === plugs_settings
    source $CONF_PATH/plugs_settings.vim
    if g:pure_vim_advanced == 1
        source $CONF_PATH/plugs_advanced_settings.vim
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
