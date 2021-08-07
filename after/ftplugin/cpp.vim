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
nnoremap <LEADER>c <Esc>k^/\/\/<CR>d2lv$hdA/* */<Esc>2hP$:set nohlsearch<CR>
nnoremap <LEADER>b <Esc>0f*ldt*<Esc>$p0f*2x$x

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
xnoremap <silent> ic :<c-u>call <sid>inComment()<cr>
onoremap <silent> ic :<c-u>call <sid>inComment()<cr>
xnoremap <silent> ac :<c-u>call <sid>aroundComment()<cr>
onoremap <silent> ac :<c-u>call <sid>aroundComment()<cr>

" ===
" === for //
" ===
function! s:inComment2()
    call search("\/\/")
    normal! 3l
    normal! vg_
endfunction
xnoremap <silent> b/ :<c-u>call <sid>inComment2()<cr>
onoremap <silent> b/ :<c-u>call <sid>inComment2()<cr>

set colorcolumn=81
set foldmethod=syntax
