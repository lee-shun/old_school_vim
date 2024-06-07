" vim: set sw=2 ts=2 sts=2 et
"
" Plugin:      https://github.com/haomingw/vim-startscreen
" Description: A simple start screen for Vim.
" Maintainer:  Haoming Wang <http://github.com/haomingw>

if exists('g:autoloaded_startscreen') || &compatible
  finish
endif
let g:autoloaded_startscreen = 1

function! s:warn(msg) abort
  echohl WarningMsg
  echomsg 'startscreen: ' . a:msg
  echohl NONE
endfunction

function! s:set_custom_section(section) abort
  if type(a:section) == type([])
    return copy(a:section)
  elseif type(a:section) == type('')
    return empty(a:section) ? [] : eval(a:section)
  endif
  return []
endfunction

function! startscreen#center(lines) abort
  let longest_line = max(map(copy(a:lines), 'strwidth(v:val)'))
  return map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2) - 1) . v:val')
endfunction

function! startscreen#start() abort
  if argc() || line2byte('$') != -1
    return
  endif
  " Handle vim -y, vim -M.
  if &insertmode || !&modifiable
    return
  endif
  if !&hidden && &modified
    call s:warn('Save your changes first.')
    return
  endif

  silent! setlocal
        \ bufhidden=wipe
        \ colorcolumn=
        \ foldcolumn=0
        \ matchpairs=
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ norelativenumber
        \ nospell
        \ noswapfile
        \ signcolumn=no
        \ laststatus=0
        \ synmaxcol&

  let header = exists('g:startscreen_custom_header')
    \ ? s:set_custom_section(g:startscreen_custom_header)
    \ : (exists('*strwidth') ? startscreen#fortune#cowsay() : [])
  let g:startscreen_header = startscreen#center(header)

  if !empty(g:startscreen_header)
    let g:startscreen_header += ['']  " add blank line
  endif
  call append('$', g:startscreen_header)
  " No modifications to this buffer
  setlocal nomodifiable nomodified

  set filetype=startscreen

  " Set mappings
  nnoremap <buffer><nowait><silent> i :enew <bar> startinsert<cr>
  nnoremap <buffer><nowait><silent> a :enew <bar> startinsert<cr>
  nnoremap <buffer><nowait><silent> o :enew <bar> startinsert<cr><cr>
  nnoremap <buffer><nowait><silent> O :enew <bar> startinsert<cr><cr><up>
  nnoremap <buffer><nowait><silent> p :enew<cr>p
  nnoremap <buffer><nowait><silent> P :enew<cr>P
  nnoremap <buffer><nowait><silent> q :q<cr>

endfunction

