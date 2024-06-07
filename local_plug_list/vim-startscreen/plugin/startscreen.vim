" vim: set sw=2 ts=2 sts=2 et
"
" Plugin:      https://github.com/haomingw/vim-startscreen
" Description: A simple start screen for Vim.
" Maintainer:  Haoming Wang <http://github.com/haomingw>

if exists('g:loaded_startscreen') || &cp
  finish
endif
let g:loaded_startscreen = 1
let s:save_cpo = &cpo
set cpo&vim

augroup startscreen
  autocmd!
  autocmd VimEnter * call startscreen#start()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
