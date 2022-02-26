"**************************************************************************************************
"
"       ___          ___          ___          ___                  ___                   ___
"      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
"     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
"    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
"   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
"  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
"  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
"       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
"        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
"                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
"                   \/__/        \|__|        \/__/                                      \/__/
"
"  Author : lee-shun
"
"  Email  : 2015097272@qq.com
"
"**************************************************************************************************

" ===
" === UI
" ===
set background=dark
colorscheme everforest
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 0
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_lightline_disable_bold = 0
let g:everforest_better_performance = 1

" ===
" === floaterm
" ===
let g:floaterm_keymap_toggle = '<F12>'

" ===
" === comment highlighting
" ===
let g:todo_highlight_config = {
            \   'STEP': {
                \     'gui_fg_color': '#ffffff',
                \     'gui_bg_color': '#27AE60 ',
                \     'cterm_fg_color': 'white',
                \     'cterm_bg_color': 'green' },
                \ }

" ===
" === lightline
" ===
let g:lightline = {
                     \ 'colorscheme': 'everforest',
                     \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
                     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
                     \ 'active': {
                     \ 'left': [ [ 'mode', 'paste' ],
                     \ [ 'gitbranch', 'readonly', 'filename', 'modified' ],
                     \ [ 'lsp_errors', 'lsp_warnings', 'lsp_ok']]
                     \ },
                     \ 'component_function': {
                     \ 'gitbranch': 'FugitiveHead'
                     \ },
                     \ 'component_expand': {
                     \ 'lsp_warnings': 'lightline_lsp#warnings',
                     \ 'lsp_errors':   'lightline_lsp#errors',
                     \ 'lsp_ok':       'lightline_lsp#ok',
                     \ },
                     \ 'component_type': {
                     \ 'lsp_warnings': 'warning',
                     \ 'lsp_errors':   'error',
                     \ 'lsp_ok':       'middle',
                     \ }
                     \ }

" ===
" === startify
" ===
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" ===
" === rooter.vim
" ===
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['compile_commands.json','.clang-format','.git','=code','package.xml']

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

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"

" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === indentLine
" ===
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0
augroup auto_indentline_ft
    autocmd!
    autocmd FileType vim :IndentLinesToggle
    autocmd FileType tex :IndentLinesToggle
    autocmd FileType cpp :IndentLinesToggle
    autocmd FileType c :IndentLinesToggle
    autocmd FileType python :IndentLinesToggle
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
" === ctrl-p
" ===
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp\|plugged$',
            \ 'file': '\.so$\|\.dat$|\.DS_Store$'
            \ }
let g:ctrlp_extensions = ['autoignore', 'funky']

nnoremap <leader>fc :CtrlPChange<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fk :CtrlPFunky<CR>
nnoremap <leader>fm :CtrlPMRUFiles<CR>
nnoremap <leader>fl :CtrlPLine<CR>

" ===
" === illuminate
" ===
let g:Illuminate_ftblacklist = ['python', 'coc-explorer']

" ===
" === emoji
" ===
" <c-x><c-u>
augroup emoji_complete
  autocmd!
  autocmd FileType markdown setlocal completefunc=emoji#complete
  " Emoji command to replace emoji name with emoji e.g. :apple: with 🍎
  command! -nargs=* Emoji %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
augroup END

" ===
" === Async
" ===
let g:asyncrun_open = 6
