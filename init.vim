"**************************************************************************************************
"    __  __        __     _____ __  __ ____   ____
"   |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"   | |\/| | | | |  \ \ / / | || |\/| | |_) | |
"   | |  | | |_| |   \ V /  | || |  | |  _ <| |___
"   |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"           |___/
"
"
"File   : init.vim
"
"Author : lee-shun
"
"Email  : 2015097272@qq.com
"
"**************************************************************************************************

"===
"=== environment
"===
let $CONF_PATH = $HOME.'/.vim'
if has('nvim')
    if has('win32')
        let $CONF_PATH = $HOME.'/AppData/Local/nvim'
    else
        let $CONF_PATH = $HOME.'/.config/nvim'
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

"===
"=== plugs_vimrc
"===
source $CONF_PATH/plugs_vimrc.vim

"===
"=== plugs_settings_vimrc
"===
source $CONF_PATH/plugs_settings_vimrc.vim
