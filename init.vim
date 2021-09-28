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
" === identify the operating system(even the git bash is different)
" ===
if !exists("g:os_name")
    if has("win64") || has("win32") || has("win16")
        let g:os_name = "Windows"
    else " not windows, use 'uname' command.
        let g:os_name = substitute(system('uname'), '\n', '', '')
        let g:os_architect =substitute(system('uname -m'), '\n', '', '') 
    endif
endif

" ===
" === python3
" ===
if g:os_name == 'Windows'&&has('nvim') " nvim on win
    let g:python3_host_prog='C:\ProgramData\Anaconda3\python.exe'
elseif g:os_name == 'Linux'
    let g:python_host_prog='/usr/bin/python'
    let g:python3_host_prog='/usr/bin/python3'
else
    echo('the os name is'.g:os_name.', please checkout!')
endif

" ===
" === control the mini and ulti mode
" ===
let g:pure_vim_ulti = 1

" ===
" === environment
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ===
" === basic_vimrc
" ===
source $CONF_PATH/basic_vimrc.vim

" ===
" === pure vim ulti mode
" ===
if g:pure_vim_ulti == 1

    " ===
    " === plugs_vimrc
    " ===
    source $CONF_PATH/plugs_vimrc.vim

    " ===
    " === plugs_settings_vimrc
    " ===
    source $CONF_PATH/plugs_settings_vimrc.vim

    " ===
    " === Automatic install plugins
    " ===
    if empty(glob($CONF_PATH."/plugged/"))
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

endif
