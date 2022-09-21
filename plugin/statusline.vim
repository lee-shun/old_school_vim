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

" Not load for ulti-mode.
if g:old_school_vim_ulti_mode == 1
    set statusline=%#normal#
  finish
endif

" ===
" === status line
" ===
" https://github.com/jdhao/minimal_vim/blob/master/init.vim
" statusline settings
let g:currentmode={
            \ 'n'  : 'NORMAL ',
            \ 'v'  : 'VISUAL ',
            \ 'V'  : 'V-Line ',
            \ "\<C-V>" : 'V-Block ',
            \ 'i'  : 'INSERT ',
            \ 'R'  : 'R ',
            \ 'Rv' : 'V·Replace ',
            \ 'c'  : 'Command ',
            \ 't' : 'Terminal',
            \}
set statusline=
set statusline+=%1*
" Show current mode
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%{&spell?'[SPELL]':''}

set statusline+=%#WarningMsg#
set statusline+=%{&paste?'[PASTE]':''}

set statusline+=%2*
" File path, as typed or relative to current directory
set statusline+=\ %F

set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ []':''}

" Truncate line here
set statusline+=%<


" Separation point between left and right aligned items.
set statusline+=%=

set statusline+=%{&filetype!=#''?&filetype.'\ ':'none\ '}

" Encoding & Fileformat
set statusline+=%#WarningMsg#
set statusline+=%{&fileencoding!='utf-8'?'['.&fileencoding.']':''}

set statusline+=%2*
set statusline+=%-7([%{&fileformat}]%)

" Time
set statusline+=[%{strftime(\"%d/%m/%y\ -\ %H:%M\")}]

" Warning about byte order
set statusline+=%#WarningMsg#
set statusline+=%{&bomb?'[BOM]':''}

set statusline+=%1*
" Location of cursor line
set statusline+=[%l/%L]

" Column number
set statusline+=\ col:%2c


" Warning about trailing spaces.
set statusline+=%#WarningMsg#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineTabWarning()}

" Recalculate the trailing whitespace warning when idle, and after saving.
augroup check_trailing_space
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
                \ | let &statusline=&statusline
augroup END

augroup check_mixed_tabs
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning
                \ | let &statusline=&statusline
augroup END

" Find if trailing spaces exist.
function! StatuslineTrailingSpaceWarning()
    if !exists('b:statusline_trailing_space_warning')
        " If the file is unmodifiable, do not warn this.
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let l:line_num = search('\s\+$', 'nw')
        if l:line_num != 0
            let b:statusline_trailing_space_warning = ' [' . l:line_num . ']' . 'trailing space'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" Find if they are mixed indentings.
function! StatuslineTabWarning()
    if !exists('b:statusline_tab_warning')
        " If the file is unmodifiable, do not warn this.
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let has_leading_tabs = search('^\t\+', 'nw') != 0
        let has_leading_spaces = search('^ \+', 'nw') != 0

        if has_leading_tabs && has_leading_spaces
            let b:statusline_tab_warning = ' [mixed-indenting]'
        elseif has_leading_tabs
            let b:statusline_tab_warning = ' [tabbed-indenting]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif

    return b:statusline_tab_warning
endfunction

" ===
" === colors
" ===
hi User1 cterm=bold gui=bold ctermfg=255 ctermbg=59
hi User2 cterm=bold gui=bold ctermfg=247 ctermbg=237
