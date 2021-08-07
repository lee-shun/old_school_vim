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
" === for commet coverting
" ===
nnoremap <buffer> <LEADER>c <Esc>k^/\/\/<CR>d2lv$hdA/* */<Esc>2hP$:set nohlsearch<CR>
nnoremap <buffer> <LEADER>b <Esc>0f*ldt*<Esc>$p0f*2x$x

" ===
" === for /**/
" ===
function! s:inComment()
    call search('\/\*\*', 'bceW')
    normal! jl
    normal! vl
    call search("\*\/", 'ceW')
    normal! kg_
endfunction

function! s:aroundComment()
    call search('\/\*\*', 'bceW')
    normal! F/
    normal! v$
    call search("\*\/", 'ceW')
    normal! $
endfunction
xnoremap <buffer> <silent> ic :<c-u>call <sid>inComment()<cr>
onoremap <buffer> <silent> ic :<c-u>call <sid>inComment()<cr>
xnoremap <buffer> <silent> ac :<c-u>call <sid>aroundComment()<cr>
onoremap <buffer> <silent> ac :<c-u>call <sid>aroundComment()<cr>

" ===
" === for //
" ===
function! s:inComment2()
    call search("\/\/")
    normal! 3l
    normal! vg_
endfunction
xnoremap <buffer> <silent> b/ :<c-u>call <sid>inComment2()<cr>
onoremap <buffer> <silent> b/ :<c-u>call <sid>inComment2()<cr>

setlocal colorcolumn=81
setlocal textwidth=81
setlocal foldmethod=syntax
