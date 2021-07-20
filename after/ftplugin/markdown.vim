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

set colorcolumn=81
set textwidth=80

" NOTE:
" 1. cancle the markdown indent, use the smart indent instead
" 2. set with formatoptions, use <CR> to continue, use o,O to have indent.
" 3. only use filetype to cancel out the additional plug setting indentexpr
" filetype indent off
" set indentexpr=

" the indent is 2 for md.
set tabstop=2
set softtabstop=2
set shiftwidth=2

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

autocmd Filetype markdown xnoremap <silent> ic :<c-u>call <sid>inCodeFence()<cr>
autocmd Filetype markdown onoremap <silent> ic :<c-u>call <sid>inCodeFence()<cr>
autocmd Filetype markdown xnoremap <silent> ac :<c-u>call <sid>aroundCodeFence()<cr>
autocmd Filetype markdown onoremap <silent> ac :<c-u>call <sid>aroundCodeFence()<cr>

" ===
" === snippets
" ===
source $CONF_PATH/after/mysnippet/markdown_snippet.vim
