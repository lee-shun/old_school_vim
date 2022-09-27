"*******************************************************************************
"                                                                              "
"          .oOOOo.   o      o       .oOOOo.         o                 o        "
"         .O     o. O      O        o     o        O                 O         "
"         O       o o      o        O.             o                 o         "
"         o       O O      o         `OOoo.        O                 O         "
"         O       o o  .oOoO              `O .oOo  OoOo. .oOo. .oOo. o         "
"         o       O O  o   O               o O     o   o O   o O   o O         "
"         `o     O' o  O   o        O.    .O o     o   O o   O o   O o         "
"          `OoooO'  Oo `OoO'o        `oooO'  `OoO' O   o `OoO' `OoO' Oo        "
"                                                                              "
"  Author : lee-shun                                                           "
"                                                                              "
"  Email  : 2015097272@qq.com                                                  "
"                                                                              "
"*******************************************************************************

" from https://github.com/phongnh/fzf-settings.vim/blob/master/plugin/fzf_settings.vim
" Extra commands

function! s:warn(message) abort
    echohl WarningMsg
    echomsg a:message
    echohl None
    return 0
endfunction

function! s:fzf_mru_cwd_source() abort
    let l:cwd = getcwd()
    return filter(fzf#vim#_recent_files(), 'fnamemodify(v:val, ":p") =~ ("^" . l:cwd)')
endfunction

function! s:fzf_mru_cwd(bang) abort
    let s:source = 'history-files-in-cwd'
    call fzf#run(fzf#wrap('history-files-in-cwd', {
                \ 'source':  s:fzf_mru_cwd_source(),
                \ 'options': ['-m', '--header-lines', !empty(expand('%')), '--prompt', 'MRU> ']
                \ }, a:bang))
endfunction

command! -bang MruCwd call <SID>fzf_mru_cwd(<bang>0)

function! s:fzf_bufopen(e) abort
    let list = split(a:e)
    if len(list) < 4
        return
    endif

    let [linenr, col, file_text] = [list[1], list[2]+1, join(list[3:])]
    let lines = getbufline(file_text, linenr)
    let path = file_text
    if empty(lines)
        if stridx(join(split(getline(linenr))), file_text) == 0
            let lines = [file_text]
            let path = bufname('%')
        elseif filereadable(path)
            let lines = ['buffer unloaded']
        else
            " Skip.
            return
        endif
    endif

    execute 'e '  . path
    call cursor(linenr, col)
endfunction

function! s:fzf_jumplist() abort
    return split(call('execute', ['jumps']), '\n')[1:]
endfunction

function! s:fzf_jumps(bang) abort
    let s:source = 'jumps'
    call fzf#run(fzf#wrap('jumps', {
                \ 'source':  s:fzf_jumplist(),
                \ 'sink':    function('s:fzf_bufopen'),
                \ 'options': '+m --prompt "Jumps> "',
                \ }, a:bang))
endfunction

command! -bang Jumps call <SID>fzf_jumps(<bang>0)

function! s:fzf_yank_sink(e) abort
    let @" = a:e
    echohl ModeMsg
    echo 'Yanked!'
    echohl None
endfunction

function! s:fzf_messages_source() abort
    return split(call('execute', ['messages']), '\n')
endfunction

function! s:fzf_messages(bang) abort
    let s:source = 'messages'
    call fzf#run(fzf#wrap('messages', {
                \ 'source':  s:fzf_messages_source(),
                \ 'sink':    function('s:fzf_yank_sink'),
                \ 'options': '+m --prompt "Messages> "',
                \ }, a:bang))
endfunction

command! -bang Messages call <SID>fzf_messages(<bang>0)

function! s:fzf_open_quickfix_item(e) abort
    let line = a:e
    let filename = fnameescape(split(line, ':\d\+:')[0])
    let linenr = matchstr(line, ':\d\+:')[1:-2]
    let colum = matchstr(line, '\(:\d\+\)\@<=:\d\+:')[1:-2]
    execute 'e ' . filename
    call cursor(linenr, colum)
endfunction

function! s:fzf_quickfix_to_grep(v) abort
    return bufname(a:v.bufnr) . ':' . a:v.lnum . ':' . a:v.col . ':' . a:v.text
endfunction

function! s:fzf_get_quickfix() abort
    return map(getqflist(), 's:fzf_quickfix_to_grep(v:val)')
endfunction

function! s:fzf_quickfix(bang) abort
    let s:source = 'quickfix'
    let items = s:fzf_get_quickfix()
    if len(items) == 0
        call s:warn('No quickfix items!')
        return
    endif
    call fzf#run(fzf#wrap('quickfix', {
                \ 'source': items,
                \ 'sink':   function('s:fzf_open_quickfix_item'),
                \ 'options': '--layout=reverse-list --prompt "Quickfix> "'
                \ }, a:bang))
endfunction

function! s:fzf_get_location_list() abort
    return map(getloclist(0), 's:fzf_quickfix_to_grep(v:val)')
endfunction

function! s:fzf_location_list(bang) abort
    let s:source = 'location_list'
    let items = s:fzf_get_location_list()
    if len(items) == 0
        call s:warn('No location list items!')
        return
    endif
    call fzf#run(fzf#wrap('location_list', {
                \ 'source': items,
                \ 'sink':   function('s:fzf_open_quickfix_item'),
                \ 'options': '--layout=reverse-list --prompt "LocationList> "'
                \ }, a:bang))
endfunction

command! -bang Quickfix call s:fzf_quickfix(<bang>0)
command! -bang LocationList call s:fzf_location_list(<bang>0)

function! s:fzf_yank_register(line) abort
    call setreg('"', getreg(a:line[7]))
    echohl ModeMsg
    echo 'Yanked!'
    echohl None
endfunction

function! s:fzf_get_registers() abort
    return split(call('execute', ['registers']), '\n')[1:]
endfunction

function! s:fzf_registers(bang) abort
    let s:source = 'registers'
    let items = s:fzf_get_registers()
    if len(items) == 0
        call s:warn('No register items!')
        return
    endif
    call fzf#run(fzf#wrap('registers', {
                \ 'source':  items,
                \ 'sink':    function('s:fzf_yank_register'),
                \ 'options': '--layout=reverse-list +m --prompt "Registers> "',
                \ }, a:bang))
endfunction

command! -bang Registers call s:fzf_registers(<bang>0)

if exists('*trim')
    function! s:strip(str) abort
        return trim(a:str)
    endfunction
else
    function! s:strip(str) abort
        return substitute(a:str, '^\s*\(.\{-}\)\s*$', '\1', '')
    endfunction
endif

function! s:fzf_outline_format(lists) abort
    for list in a:lists
        let linenr = list[2][:len(list[2])-3]
        let line = s:strip(getline(linenr))
        let list[0] = substitute(line, list[0], printf("\x1b[34m%s\x1b[m", list[0]), '')
        call map(list, "printf('%s', v:val)")
    endfor
    return a:lists
endfunction

function! s:fzf_outline_source(tag_cmds) abort
    if !filereadable(expand('%'))
        throw 'Save the file first'
    endif
    let lines = []
    for cmd in a:tag_cmds
        let lines = split(system(cmd), "\n")
        if !v:shell_error && len(lines)
            break
        endif
    endfor
    if v:shell_error
        throw get(lines, 0, 'Failed to extract tags')
    elseif empty(lines)
        throw 'No tags found'
    endif
    return map(s:fzf_outline_format(map(lines, 'split(v:val, "\t")')), 'join(v:val, "\t")')
endfunction

function! s:fzf_outline_sink(lines) abort
    if !empty(a:lines)
        let line = a:lines[0]
        execute split(line, "\t")[2]
    endif
endfunction

function! s:fzf_outline(bang) abort
    try
        let s:source = 'outline'
        let filetype = get({ 'cpp': 'c++' }, &filetype, &filetype)
        let tag_cmds = [
                    \ printf('%s -f - --sort=no --excmd=number --language-force=%s %s 2>/dev/null', g:fzf_ctags, filetype, expand('%:S')),
                    \ printf('%s -f - --sort=no --excmd=number %s 2>/dev/null', g:fzf_ctags, expand('%:S'))
                    \ ]
        call fzf#run(fzf#wrap('outline', {
                    \ 'source':  s:fzf_outline_source(tag_cmds),
                    \ 'sink*':   function('s:fzf_outline_sink'),
                    \ 'options': '--layout=reverse-list -m -d "\t" --with-nth 1 -n 1 --ansi --prompt "Outline> "'
                    \ }, a:bang))
    catch
        call s:warn(v:exception)
    endtry
endfunction

command! -bang BOutline call s:fzf_outline(<bang>0)

" from https://github.com/junegunn/fzf.vim/issues/865

function GoTo(jumpline)
  let values = split(a:jumpline, ":")
  execute "e ".values[0]
  call cursor(str2nr(values[1]), str2nr(values[2]))
  execute "normal zvzz"
endfunction

function GetLine(bufnr, lnum)
  let lines = getbufline(a:bufnr, a:lnum)
  if len(lines)>0
    return trim(lines[0])
  else
    return ''
  endif
endfunction

function! Jumps()
  " Get jumps with filename added
  let jumps = map(reverse(copy(getjumplist()[0])), 
    \ { key, val -> extend(val, {'name': getbufinfo(val.bufnr)[0].name }) })
 
  let jumptext = map(copy(jumps), { index, val -> 
      \ (val.name).':'.(val.lnum).':'.(val.col+1).': '.GetLine(val.bufnr, val.lnum) })

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': jumptext,
        \ 'column': 1,
        \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
        \ 'sink': function('GoTo')})))
endfunction

command! Jumps call Jumps()

function! Changes()
  let changes  = reverse(copy(getchangelist()[0]))

  let changetext = map(copy(changes), { index, val -> 
      \ expand('%').':'.(val.lnum).':'.(val.col+1).': '.GetLine(bufnr('%'), val.lnum) })

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': changetext,
        \ 'column': 1,
        \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
        \ 'sink': function('GoTo')})))
endfunction

command! Changes call Changes()

" ===
" === maps
" ===
noremap <leader>ff :Files<CR>
noremap <leader>fb :Buffers<CR>
noremap <leader>fm :History<CR>
noremap <leader>fl :BLines<CR>
noremap <leader>fw :Rg<CR>
noremap <leader>fj :Jumps<CR>
noremap <leader>fc :Changes<CR>
