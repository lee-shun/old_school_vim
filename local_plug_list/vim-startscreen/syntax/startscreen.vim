" vim: set sw=2 ts=2 sts=2 et
"
" Plugin:      https://github.com/haomingw/vim-startscreen
" Description: A simple start screen for Vim.
" Maintainer:  Haoming Wang <http://github.com/haomingw>

if exists("b:current_syntax")
  finish
endif

execute 'syntax region startscreenHeader start=/\%1l/ end=/\%'. (len(g:startscreen_header) + 2) .'l/'

highlight default link startscreenHeader  Title

let b:current_syntax = 'startscreen'
