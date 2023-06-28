if exists('g:loaded_streamline_plugin')
    finish
endif

if  g:osv_plug_general == 1
    if has('nvim') || v:version >= 800 " ready to use fancy line, otherwise use this!
        finish
    endif
endif

let g:loaded_streamline_plugin = 1

set laststatus=2
set statusline=%!CreateStatusline()
augroup status
    autocmd!
    autocmd WinEnter * setlocal statusline=%!CreateStatusline()
    autocmd WinLeave * setlocal statusline=%!CreateInactiveStatusline()
    autocmd BufEnter * call GetGitBranch()
augroup END

hi WarningColor guibg=#E5C07B guifg=#1E1E1E ctermbg=Yellow ctermfg=Black
hi ErrorColor guibg=#DF6A63 guifg=#1E1E1E ctermbg=Red ctermfg=Black

let s:streamline_spec_filetypes = ['fern', 'coc-explorer', 'defx', 'vimfiler']

function! CreateStatusline()
    if index(s:streamline_spec_filetypes, &ft) >= 0
        let statusline=''
        let statusline.='☰ '.&ft
        return statusline
    endif
    let statusline=''
    let statusline.='%#Cursor#'
    let statusline.=' %{GetMode()} '
    let statusline.='%#diffadd#'
    let statusline.=s:git_branch
    let statusline.='%#CursorlineNr#'
    if get(g:, 'streamline_enable_devicons', 1) && exists('*WebDevIconsGetFileTypeSymbol')
        let statusline.=' %{WebDevIconsGetFileTypeSymbol()}'
    else
        let statusline.=' %y'              " Show filetype
    endif
    if get(g:, 'streamline_show_ale_status', 1) && exists(':ALELint')
        let statusline.='%#WarningColor#'
        let statusline.='%{GetAleStatus()[0]}'
        let statusline.='%#ErrorColor#'
        let statusline.='%{GetAleStatus()[1]}'
    endif
    if get(g:, 'streamline_show_coc_status', 1) && exists('g:coc_enabled')
        let statusline.='%#WarningMsg#'
        let statusline.=GetCocStatus()
        let statusline.='%#CursorlineNr#'
    endif
    let statusline.=' %f'                  " Show filename
    let statusline.=' %m '                  " Show modified tag
    let statusline.='%='                   " Switch elements to the right
    if !get(g:, 'streamline_minimal_ui', 0)
        let statusline.='%{&fileencoding?&fileencoding:&encoding}'
        let statusline.=' %{&fileformat} '
        let statusline.='%#TermCursor#'
        let statusline.='▏'
    endif
    let statusline.='☰ %l:%c'              " Show line number and column
    let statusline.=' %p%% '               " Show percentage
    return statusline
endfunction

function! CreateInactiveStatusline()
    if index(s:streamline_spec_filetypes, &ft) >= 0
        let statusline=''
        let statusline.='☰ '.&ft
        return statusline
    endif
    let statusline=''
    let statusline.='%#Whitespace#'
    let statusline.='▏'
    if get(g:, 'streamline_enable_devicons', 1) && exists('*WebDevIconsGetFileTypeSymbol')
        let statusline.=' %{WebDevIconsGetFileTypeSymbol()}'
    else
        let statusline.=' %y'
    endif
    let statusline.=' %f'
    let statusline.=' %m'
    let statusline.='%='
    let statusline.='☰ %l:%c'              " Show line number and column
    let statusline.=' %p%% '
    return statusline
endfunction

function! GetGitBranch()
    let l:branch = osv_ultis#system#exec('cd '.expand('%:p:h').' && git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d "\n"')
    let s:git_branch = !strlen(l:branch) || !isdirectory(expand('%:p:h')) ? '' : '▏' . l:branch . ' '
endfunction

function GetAleStatus()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:formated_errors = l:all_errors == 0 ? '' : '' . l:all_errors . ' '
    let l:all_warnings = l:counts.total - l:all_errors
    let l:formated_warnings = l:all_warnings == 0 ? '' : '' . l:all_warnings . ' '
    return [l:formated_warnings, l:formated_errors]
endfunction

function GetCocStatus()
    let l:coc_status = substitute(coc#status(), "E", "", "")
    return substitute(l:coc_status, "W", "", "")
endfunction

function! GetMode()
    let l:mode=mode(1)
    if l:mode ==# 'i'
        return 'INSERT'
    elseif l:mode ==# 'c'
        return 'COMMAND'
    elseif l:mode ==# 'v'
        return 'VISUAL'
    elseif l:mode ==# 'V'
        return 'V-LINE'
    elseif l:mode ==# "\<C-V>"
        return 'V-BLOCK'
    elseif l:mode ==? 'R' || l:mode ==? 'Rv'
        return 'REPLACE'
    elseif l:mode ==? 't'
        return 'TERMINAL'
    else
        return 'NORMAL'
    endif
endfunction

call GetGitBranch()
