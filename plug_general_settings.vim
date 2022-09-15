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

" ===
" === UI
" ===
set background=dark
colorscheme seoul256

" ===
" === floaterm
" ===

" ===
" === comment highlighting
" ===
let g:todo_highlight_config = {
            \   'STEP': {
            \     'gui_fg_color': '#ffffff',
            \     'gui_bg_color': '#27AE60 ',
            \     'cterm_fg_color': 'white',
            \     'cterm_bg_color': 'green' },
            \   'NOTE': {
            \     'gui_fg_color': '#ffffff',
            \     'gui_bg_color': '#ffbd2a',
            \     'cterm_fg_color': 'white',
            \     'cterm_bg_color': '214'
            \   }
            \ }

" ===
" === lightline
" ===

" ===
" === rooter.vim
" ===
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.vim_root', 'compile_commands.json','.clang-format','.git','=code','package.xml']


" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === indentLine
" ===
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_bgcolor_term = 237
let g:indentLine_leadingSpaceChar = '·'
augroup auto_indentline_ft
    autocmd!
    autocmd FileType vim IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType tex IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType cpp IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType c IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType python IndentLinesEnable | LeadingSpaceEnable
augroup END

" ===
" === auto save
" ===
let g:auto_save = 0
let g:auto_save_silent = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]

augroup auto_save_ft
    autocmd!
    autocmd FileType tex let b:auto_save = 1
    autocmd FileType c let b:auto_save = 1
    autocmd FileType cpp let b:auto_save = 1
    autocmd FileType cmake let b:auto_save = 1
augroup END


" ===
" === illuminate
" ===
let g:Illuminate_ftblacklist = ['python']

" ===
" === Async
" ===
" let g:asyncrun_open = 6

" ===
" === vim-cool
" ===
" let g:CoolTotalMatches = 1
