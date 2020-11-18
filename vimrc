"**************************************************************************************************
"    __  __        __     _____ __  __ ____   ____
"   |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"   | |\/| | | | |  \ \ / / | || |\/| | |_) | |
"   | |  | | |_| |   \ V /  | || |  | |  _ <| |___
"   |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"           |___/
"
"
"File   : vimrc
"
"Author : lee-shun
"
"Email  : 2015097272@qq.com
"
"**************************************************************************************************

 " ===
 " === Auto load for first time uses
 " ===
 if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
         autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
         endif


"===
"=== python_path
""===
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'


"===
"=== basic_vimrc
"===

source ~/.vim/basic_vimrc.vim


"===
"=== plugs_vimrc
"===

source ~/.vim/plugs_vimrc.vim


"===
"=== plugs_settings_vimrc
"===

source ~/.vim/plugs_settings_vimrc.vim
