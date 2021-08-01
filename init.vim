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
let g:pure_vim_mini = 0

" ===
" === environment
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

" ===
" === basic_vimrc
" ===
source $CONF_PATH/basic_vimrc.vim

" ===
" === function_vimrc
" ===
source $CONF_PATH/function_vimrc.vim

if g:pure_vim_mini == 0

  " ===
  " === Automatic install
  " ===
  if empty(glob($CONF_PATH."/plugged/"))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " ===
  " === plugs_vimrc
  " ===
  source $CONF_PATH/plugs_vimrc.vim

  " ===
  " === plugs_settings_vimrc
  " ===
  source $CONF_PATH/plugs_settings_vimrc.vim

endif
