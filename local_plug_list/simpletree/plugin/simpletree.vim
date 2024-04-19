" ============================================================================
" File:        plugin/simpletree.vim
" Description: Simple file tree plugin
" Author:      Pablo E. Papousek <pablo.papousek@gmail.com>
" Licence:     MIT licence
" Website:     https://github.com/psicopep/simpletree
" Version:     0.5
" ============================================================================


if (exists('g:simpletree_loaded') && g:simpletree_loaded) || &cp || version < 700
  finish
endif
let g:simpletree_loaded = 1

command! -nargs=0 SimpleTreeToggle       :call simpletree#ToggleTree()
