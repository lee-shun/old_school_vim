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

" NOTE:
" 1. cancle the markdown indent, use the smart indent instead
" 2. set with formatoptions, use <CR> to continue, use o,O to have indent.
" 3. only use filetype to cancel out the additional plug setting indentexpr
" filetype indent off
" set indentexpr=

" the indent is 2 for markdown.
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal spell

function! s:inCodeFence()
    " Search backwards for the opening of the code fence.
    call search('^```.*$', 'bceW')
    " Move one line down
    normal! j
    " Move to the begining of the line at start selecting
    normal! 0v
    " Search forward for the closing of the code fence.
    call search("```", 'ceW')

    normal! kg_
endfunction

function! s:aroundCodeFence()
    " Search backwards for the opening of the code fence.
    call search('^```.*$', 'bcW')
    normal! v$
    " Search forward for the closing of the code fence.
    call search('```', 'eW')
endfunction

xnoremap <buffer> <silent> ic :<c-u>call <sid>inCodeFence()<cr>
onoremap <buffer> <silent> ic :<c-u>call <sid>inCodeFence()<cr>
xnoremap <buffer> <silent> ac :<c-u>call <sid>aroundCodeFence()<cr>
onoremap <buffer> <silent> ac :<c-u>call <sid>aroundCodeFence()<cr>

" ===
" === For checkbox
" ===
function! ToggleComplete()
    " Get current line:
    let l:line = getline('.')

    " Get the char to test with the help of a pattern, ' ' or 'X':
    " \zs and \ze lets you retrieve only the part between themselves:
    let l:char = matchstr(l:line, '\[\zs.\ze]')

    " Invert the value:
    if l:char == 'x'
        let l:char = ' '
    else
        let l:char = 'x'
    endif

    " Replace the current line with a new one, with the right
    " char substituted:
    call setline(line('.'), substitute(l:line, '\[\zs.\ze]', l:char, ''))

    " Please note that this last line is doing the desired job. There is
    " no need to return anything
endfunction

" ===
" === use the mkdx instead
" ===
" nnoremap <buffer> <LEADER>c :call ToggleComplete()<CR>
