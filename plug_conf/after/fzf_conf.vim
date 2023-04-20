" ===
" === basic
" ===
" Check if Popup/Floating Win is available for FZF or not
if has('nvim')
    let s:has_popup = exists('*nvim_win_set_config') && has('nvim-0.4.2')
else
    let s:has_popup = exists('*popup_create') && has('patch-8.2.191')
endif

if s:has_popup
    let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.9 } }
else
    if has('nvim') || has('gui_running')
        let $FZF_DEFAULT_OPTS .= ' --inline-info'
    endif

    if !has('nvim')
        " Make all FZF commands to use fullscreen layout in VIM
        let g:fzf_layout = {}
    endif
endif

let s:fzf_preview_key    = get(g:, 'fzf_preview_key', 'ctrl-/')
let g:fzf_preview_window = ['up:50%', s:fzf_preview_key]

" from https://github.com/phongnh/fzf-settings.vim/blob/master/plugin/fzf_settings.vim
" Extra commands

function! s:warn(message) abort
    echohl WarningMsg
    echomsg a:message
    echohl None
    return 0
endfunction

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

" ===
" === Jumps list and Change list
" ===
" from https://github.com/junegunn/fzf.vim/issues/865

function s:go_to(jumpline) abort
    let values = split(a:jumpline, ":")
    execute "e ".values[0]
    call cursor(str2nr(values[1]), str2nr(values[2]))
    execute "normal zvzz"
endfunction

function s:get_line(bufnr, lnum) abort
    let lines = getbufline(a:bufnr, a:lnum)
    if len(lines)>0
        return trim(lines[0])
    else
        return ''
    endif
endfunction

function s:get_jumps() abort
    let jumps = []
    let raw_jumps = reverse(copy(getjumplist()[0]))
    for it in raw_jumps
        if bufexists(it.bufnr)
            call add(jumps, it)
        endif
    endfor
    return jumps
endfunction

function! s:fzf_jumps(bang) abort
    " Get jumps with filename added
    let tmp_jump = s:get_jumps()
    if(tmp_jump == [])
        call s:warn('Empty jump list!')
        return
    endif
    let jumps = map(tmp_jump,
                \ { key, val -> extend(val, {'fname': getbufinfo(val.bufnr)[0].name }) })

    let jumptext = map(copy(jumps), { index, val -> 
                \ (val.fname).':'.(val.lnum).':'.(val.col+1).': '.s:get_line(val.bufnr, val.lnum) })

    call fzf#run(fzf#vim#with_preview(fzf#wrap({
                \ 'source': jumptext,
                \ 'column': 1,
                \ 'options': ['--delimiter', ':', '--preview-window', '+{2}-/2', '--prompt', 'JumpList>'],
                \ 'sink': function('s:go_to')}, a:bang)))
endfunction

command! -bang Jumps call s:fzf_jumps(<bang>0)

function! s:fzf_changes(bang) abort
    let changes  = reverse(copy(getchangelist()[0]))
    if(changes == [])
        call s:warn('Empty change list!')
        return
    endif

    let changetext = map(copy(changes), { index, val ->
                \ expand('%').':'.(val.lnum).':'.(val.col+1).': '.s:get_line(bufnr('%'), val.lnum) })

    call fzf#run(fzf#vim#with_preview(fzf#wrap({
                \ 'source': changetext,
                \ 'column': 1,
                \ 'options': ['--delimiter', ':', '--preview-window', '+{2}-/2', '--prompt', 'ChangeList>'],
                \ 'sink': function('s:go_to')}, a:bang)))
endfunction

command! -bang Changes call s:fzf_changes(<bang>0)

" ===
" === maps
" ===
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fm :History<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <leader>fj :Jumps<CR>
nnoremap <leader>fc :Changes<CR>
