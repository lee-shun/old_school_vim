" ============================================================================
" File:        autoload/simpletree.vim
" Description: Simple file tree plugin
" Author:      Pablo E. Papousek <pablo.papousek@gmail.com>
" Licence:     MIT licence
" Website:     https://github.com/psicopep/simpletree
" Version:     0.5
" ============================================================================


" Configuration

let s:is_windows = has('win32') || has('win64')
let s:tree_style = exists('g:simpletree_style') ? g:simpletree_tree_style : 1
let s:tree_window_width = exists('g:simpletree_width') ? g:simpletree_width : 40
let s:show_hidden_files = exists('g:simpletree_show_hidden') ? g:simpletree_show_hidden : 0
let s:use_arrows = exists('g:simpletree_use_arrows') ? g:simpletree_use_arrows : 0
let s:close_on_esc = exists('g:simpletree_close_on_esc') ? g:simpletree_close_on_esc : 1

" Public functions

function! simpletree#ToggleTree()
  let l:tree_buffer = s:get_tree_buffer()
  if l:tree_buffer == 0
    call s:new_tree()
  elseif bufwinnr(l:tree_buffer) == -1
    call s:show_tree()
  else
    call s:hide_tree()
  endif
endfunction

" Internal functions

if s:use_arrows
  let s:prefix_dir_closed = '▸ '
  let s:prefix_dir_open = '▾ '
else
  let s:prefix_dir_closed = '+ '
  let s:prefix_dir_open = '- '
endif
let s:prefix_file = '  '
let s:prefix_level = '  '
let s:prefixes = [s:prefix_dir_closed, s:prefix_dir_open, s:prefix_file]
if s:is_windows
  let s:sep = '\'
else
  let s:sep = '/'
endif
let s:edit_window = -1
let s:tree_buffer = 0
let s:root_dir = ''
let s:relative_paths = []
let s:line_levels = []

function! s:new_tree()
  call s:save_edit_window()
  silent topleft vnew SimpleTree
  exe 'vertical resize ' . s:tree_window_width
  setlocal winfixwidth
  let s:tree_buffer = bufnr('%')
  setlocal nobuflisted buftype=nofile noswapfile
  call s:reset_tree(getcwd())
  call s:refresh_highlight()
  setlocal nomodifiable
  nnoremap <buffer> <silent> <CR> :call <SID>cd_or_edit()<CR>
  nnoremap <buffer> <silent> o :call <SID>cd_or_edit()<CR>
  nnoremap <buffer> <silent> <S-CR> :call <SID>chg_root()<CR>
  nnoremap <buffer> <silent> <S-o> :call <SID>chg_root()<CR>
  nmap <buffer> <silent> - gg<CR>
  nnoremap <buffer> <silent> r :call <SID>reload_tree(0)<CR>
  nnoremap <buffer> <silent> R :call <SID>reload_tree(1)<CR>
  nnoremap <buffer> <silent> za :call <SID>toggle_hidden_files()<CR>
  nnoremap <buffer> <silent> q :call simpletree#ToggleTree()<CR>
  if s:close_on_esc
    nnoremap <buffer> <silent> <Esc> :call simpletree#ToggleTree()<CR>
  endif
endfunction

function! s:show_tree()
  call s:save_edit_window()
  let l:tree_buffer = s:get_tree_buffer()
  silent topleft vsplit
  exe 'vertical resize ' . s:tree_window_width
  setlocal winfixwidth
  exe 'silent buffer ' . l:tree_buffer
  call s:refresh_statusline()
  call s:refresh_highlight()
  setlocal nomodifiable
endfunction

function! s:hide_tree()
  let l:tree_window = bufwinnr(s:tree_buffer)
  call s:goto_window(l:tree_window)
  wincmd q
  if s:edit_window <= bufwinnr('$')
    call s:goto_window(s:edit_window)
  endif
endfunction

function! s:reset_tree(dir)
  let s:root_dir = a:dir
  silent 1,$delete _
  let [l:dirs, l:files] = s:list_dir(a:dir)
  let l:tree_offset = 0
  call insert(l:dirs, '..')
  for i in range(len(l:dirs))
    let l:line_number = l:tree_offset + i + 1
    call setline(l:line_number, s:prefix_dir_closed . l:dirs[i])
  endfor
  let l:tree_offset = l:tree_offset + len(l:dirs)
  for i in range(len(l:files))
    let l:line_number = l:tree_offset + i + 1
    call setline(l:line_number, s:prefix_file . l:files[i])
  endfor
  let s:relative_paths = []
  let s:line_levels = []
  for i in range(len(l:dirs) + len(l:files) + 1)
    call add(s:relative_paths, '')
    call add(s:line_levels, 0)
  endfor
  call s:refresh_statusline()
endfunction

function! s:list_dir(dir)
  let l:list = s:glob(a:dir . s:sep . '*')
  if s:show_hidden_files
    let l:list_dot = s:glob(a:dir . s:sep . '.[^.]*')
    let l:list = l:list_dot + l:list
  endif
  let l:dirs = []
  let l:files = []
  for i in range(len(l:list))
    if isdirectory(l:list[i])
      call add(l:dirs, l:list[i])
    else
      call add(l:files, l:list[i])
    endif
  endfor
  call map(l:dirs, 'fnamemodify(v:val, ":t")')
  call map(l:files, 'fnamemodify(v:val, ":t")')
  return [l:dirs, l:files]
endfunction

function! s:glob(expr)
  if has("patch-7.3-465")
    let l:list = glob(a:expr, 1, 1)
  elseif has("patch-7.2-051")
    let l:str = glob(a:expr, 1)
    let l:list = split(l:str, '\n')
  else
    let l:str = glob(a:expr)
    let l:list = split(l:str, '\n')
  endif
  return l:list
endfunction

function! s:cd_or_edit()
  let l:line = getline('.')
  let l:line_number = line('.')
  let l:line_level = s:get_line_level(l:line_number)
  let l:name = s:remove_prefixes(l:line, s:prefixes, l:line_level)
  if l:name ==# '..'
    call s:cd_up()
  elseif s:is_dir_line(l:line, l:line_number)
    if s:tree_style == 0
      call s:cd_down(l:name)
    elseif s:remove_prefixes(l:line, [], l:line_level) =~ s:prefix_dir_closed
      call s:cd_open(l:name, l:line_number, l:line_level)
    else
      call s:cd_close(l:name, l:line_number, l:line_level)
    endif
  else
    call s:edit_file(l:name, l:line_number)
    call s:hide_tree()
  endif
endfunction

function! s:edit_file(file, line_number)
  call s:goto_window(s:edit_window + 1)
  let l:path = s:get_full_path(a:file, a:line_number)
  exe 'edit ' . substitute(l:path, ' ', '\\ ', 'g')
endfunction

function! s:cd_up()
  setlocal modifiable
  call s:reset_tree(s:get_parent_dir(s:root_dir))
  setlocal nomodifiable
endfunction

function! s:cd_down(dir)
  setlocal modifiable
  call s:reset_tree(s:root_dir . s:sep . a:dir)
  setlocal nomodifiable
endfunction

function! s:cd_open(name, line_number, line_level)
  setlocal modifiable
  let [l:dirs, l:files] = s:list_dir(s:get_full_path(a:name, a:line_number))
  let l:level_prefix = s:get_level_prefix(a:line_level + 1)
  call map(l:dirs, 'l:level_prefix . s:prefix_dir_closed . v:val')
  call map(l:files, 'l:level_prefix . s:prefix_file . v:val')
  let l:both = l:dirs + l:files
  if len(l:both) > 0
    call append(a:line_number, l:both)
    let l:relative_path = s:get_relative_path(a:line_number)
    if l:relative_path != ''
      let l:relative_path = l:relative_path . s:sep
    endif
    let l:relative_path = l:relative_path . a:name
    let l:use_add = a:line_number + 1 >= len(s:relative_paths)
    for i in range(len(l:both))
      if l:use_add
        call add(s:relative_paths, l:relative_path)
        call add(s:line_levels, a:line_level + 1)
      else
        call insert(s:relative_paths, l:relative_path, a:line_number + 1)
        call insert(s:line_levels, a:line_level + 1, a:line_number + 1)
      endif
    endfor
  endif
  let l:level_prefix = s:get_level_prefix(a:line_level)
  call setline(a:line_number, l:level_prefix . s:prefix_dir_open . a:name)
  setlocal nomodifiable
endfunction

function! s:cd_close(name, line_number, line_level)
  setlocal modifiable
  let l:child_line_number = a:line_number + 1
  let l:child_line_level = a:line_level + 1
  if a:line_number < line('$')
    while(s:get_line_level(l:child_line_number) >= l:child_line_level)
      exe l:child_line_number . 'delete _'
      call remove(s:relative_paths, l:child_line_number)
      call remove(s:line_levels, l:child_line_number)
    endwhile
  endif
  exe 'normal ' . a:line_number . 'G'
  let l:level_prefix = s:get_level_prefix(a:line_level)
  call setline(a:line_number, l:level_prefix . s:prefix_dir_closed . a:name)
  setlocal nomodifiable
endfunction

function! s:chg_root()
  let l:line = getline('.')
  let l:line_number = line('.')
  let l:line_level = s:get_line_level(l:line_number)
  let l:name = s:remove_prefixes(l:line, s:prefixes, l:line_level)
  if l:name !=# '..' && s:is_dir_line(l:line, l:line_number)
    setlocal modifiable
    call s:reset_tree(s:get_full_path(l:name, l:line_number))
    setlocal nomodifiable
  endif
endfunction

function! s:reload_tree(cwd)
  setlocal modifiable
  call s:reset_tree(a:cwd ? getcwd() : s:root_dir)
  setlocal nomodifiable
endfunction

function! s:toggle_hidden_files()
  let s:show_hidden_files = !s:show_hidden_files
  setlocal modifiable
  call s:reset_tree(s:root_dir)
  setlocal nomodifiable
endfunction

" Internal Auxiliary Functions

function! s:get_tree_buffer()
  for b in range(1, bufnr('$'))
    if stridx(bufname(b), 'SimpleTree') == 0
      return b
    endif
  endfor
  return 0
endfunction

function! s:save_edit_window()
  let s:edit_window = winnr()
endfunction

function! s:goto_window(window)
  exe a:window . 'wincmd w'
endfunction

function! s:get_parent_dir(dir)
  return fnamemodify(a:dir, ':h')
endfunction

function! s:get_full_path(name, relative_path_index)
  let l:dir = s:root_dir
  if a:relative_path_index > 0 && get(s:relative_paths, a:relative_path_index, '') != ''
    let l:dir = l:dir . s:sep . s:relative_paths[a:relative_path_index]
  endif
  return l:dir . s:sep . a:name
endfunction

function! s:get_relative_path(relative_path_index)
  return get(s:relative_paths, a:relative_path_index, '')
endfunction

function! s:is_dir(name)
  return isdirectory(s:get_full_path(a:name, 0))
endfunction

function! s:is_dir_line(line, line_number)
  let l:line_level = s:get_line_level(a:line_number)
  let l:name = s:remove_prefixes(a:line, [], l:line_level)
  return l:name =~ '^' . s:prefix_dir_closed || l:name =~ '^' . s:prefix_dir_open
endfunction

function! s:remove_prefixes(name, prefixes, line_level)
  let l:name = a:name
  for i in range(a:line_level)
    let l:name = substitute(l:name, '^' . s:prefix_level, '', '')
  endfor
  for i in range(len(a:prefixes))
    let l:name = substitute(l:name, '^' . a:prefixes[i], '', '')
  endfor
  return l:name
endfunction

function! s:get_line_level(line_number)
  return get(s:line_levels, a:line_number, 0)
endfunction

function! s:get_level_prefix(line_level)
  let l:prefix = ''
  for i in range(a:line_level)
    let l:prefix = l:prefix . s:prefix_level
  endfor
  return l:prefix
endfunction

function! s:refresh_statusline()
  let l:path = s:root_dir
  if s:is_windows
    let l:path = substitute(l:path, '\\', '\\\\', 'g')
  endif
  exe "setlocal statusline=%." . s:tree_window_width . "{'" . l:path . "'}"
endfunction

function! s:refresh_highlight()
  let l:dir_closed = substitute(s:prefix_dir_closed, ' ', '', 'g')
  let l:dir_open = substitute(s:prefix_dir_open, ' ', '', 'g')
  exe 'match Directory /^\s*[' . l:dir_closed . l:dir_open . '].*/'
endfunction
