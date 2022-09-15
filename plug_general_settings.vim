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
let g:floaterm_keymap_toggle = '<F12>'
nnoremap <leader>ra :FloatermNew --height=0.6 --width=0.8 --wintype=float ranger<CR>

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
let g:lightline = {
            \ 'colorscheme': g:colors_name,
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'active': {
            \ 'left': [ [ 'mode', 'paste' ],
            \ [ 'readonly', 'filename', 'modified' ],
            \ [ 'gitbranch', 'gitdiff']],
            \ 'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename' ] ],
            \   'right': [ [ 'filetype' ] ] },
            \ 'component_function': {
            \ 'gitbranch': 'FugitiveHead',
            \ },
            \ 'component_expand': {
            \ 'gitdiff': 'lightline#gitdiff#get',
            \ },
            \ }

" ===
" === rooter.vim
" ===
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.vim_root', 'compile_commands.json','.clang-format','.git','=code','package.xml']

" ===
" === Fern.vim
" ===
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_smart_quit = 1
let g:fern_renderer_devicons_disable_warning = 1

noremap <silent> <leader>t :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
    nmap <buffer> S <Plug>(fern-action-open:split)
    nmap <buffer> V <Plug>(fern-action-open:vsplit)
    nmap <buffer> R <Plug>(fern-action-rename)
    nmap <buffer> M <Plug>(fern-action-move)
    nmap <buffer> C <Plug>(fern-action-copy)
    nmap <buffer> P <Plug>(fern-action-new-path)
    nmap <buffer> F <Plug>(fern-action-new-file)
    nmap <buffer> D <Plug>(fern-action-new-dir)
    nmap <buffer> H <Plug>(fern-action-hidden-toggle)
    nmap <buffer> T <Plug>(fern-action-trash)
    nmap <buffer> B <Plug>(fern-action-mark)
endfunction

let g:fern#renderer = "nerdfont"

augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call s:init_fern()
    autocmd FileType fern call s:disable_lightline_on_fern()
    autocmd WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_fern()
augroup END

fu s:disable_lightline_on_fern() abort
    let fern_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'fern') + 1
    call timer_start(0, {-> fern_winnr && setwinvar(fern_winnr, '&stl', '%#Normal#')})
endfu

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
" === LeaderF
" ===
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 1
let g:Lf_IgnoreCurrentBufferName = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fw :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>

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
