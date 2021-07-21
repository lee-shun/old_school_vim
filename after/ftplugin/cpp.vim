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

nnoremap <LEADER>c <Esc>k^/\/\/<CR>d2lv$hdA/* */<Esc>2hP$:set nohlsearch<CR>

function! s:inComment()
    call search("\*\/", 'ceW')
    normal! kg_
    normal! v
    call search('\/\*\*', 'bceW')
    normal! jl
endfunction

function! s:aroundCodeFence()
    call search('\/\*\*', 'bceW')
    normal! F/
    normal! v$
    call search("\*\/", 'ceW')
    normal! $
endfunction

xnoremap <silent> ic :<c-u>call <sid>inComment()<cr>
onoremap <silent> ic :<c-u>call <sid>inComment()<cr>
xnoremap <silent> ac :<c-u>call <sid>aroundCodeFence()<cr>
onoremap <silent> ac :<c-u>call <sid>aroundCodeFence()<cr>

set colorcolumn=81   " 设置80列提示
set foldmethod=syntax

source $CONF_PATH/after/mysnippet/cpp_hpp_snippet.vim
