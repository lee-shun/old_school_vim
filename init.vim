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
" === python3
" ===
" let g:python3_host_prog = '/home/ls/anaconda3/envs/mlcv/bin/python'
" let g:python_host_prog = '/usr/bin/python'

let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

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
