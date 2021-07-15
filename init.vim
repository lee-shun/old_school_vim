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

"===
"=== control the mini and ulti mode
"===
let g:pure_vim_mini = 0

"===
"=== environment
"===
if has('nvim')
    if has('win32') " nvim on windows
        let $CONF_PATH = $HOME.'/AppData/Local/nvim'
    else " nvim on linux
        let $CONF_PATH = $HOME.'/.config/nvim'
    endif
else
    if has('win32')  " vim on windows
        if has('gui_running') " gvim on windows
            let $CONF_PATH = $HOME.'/vimfiles'
        else " vim in Git Bash
            let $CONF_PATH = $HOME.'/.vim'
        endif
    else " vim on linux
        let $CONF_PATH = $HOME.'/.vim'
    endif

endif

"===
"=== basic_vimrc
"===
source $CONF_PATH/basic_vimrc.vim


"===
"=== function_vimrc
"===
source $CONF_PATH/function_vimrc.vim

if g:pure_vim_mini == 0
    "===
    "=== plugs_vimrc
    "===
    source $CONF_PATH/plugs_vimrc.vim

    "===
    "=== plugs_settings_vimrc
    "===
    source $CONF_PATH/plugs_settings_vimrc.vim
endif
