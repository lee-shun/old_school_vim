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
colorscheme nord
let g:everforest_style = 'atlantis'
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
                     \ 'colorscheme': 'nord',
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
let g:rooter_patterns = ['.git', '=code', 'compile_commands.json', 'package.xml']

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

let g:fern#renderer = "devicons"

" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === indentLine
" ===
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0

" ===
" === indent_guides
" ===
let g:indent_guides_enable_on_vim_startup = 0

" ===
" === auto save
" ===
let g:auto_save = 0
let g:auto_save_silent = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]

augroup ft_tex
    autocmd!
    autocmd FileType tex let b:auto_save = 1
augroup END

" ===
" === markdown
" ===
" NOTE: use the plasticboy markdown sytanx file + SidOFc mxkd.vim functions.
let g:vim_markdown_math=1
let g:vim_markdown_conceal=1
let g:closetag_html_style=1

" ===
" === markdown_preview
" ===
let vim_markdown_preview_github=1

" ===
" === markdown paste image
" ===
let g:mdip_imgdir = 'img'
command! -nargs=0 PastImg :call mdip#MarkdownClipboardImage()

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
" === vimtex
" ===
let g:vimtex_mappings_enabled=0
let g:vimtex_imaps_enabled=0
let g:vimtex_text_obj_enabled=0
let g:vimtex_fold_enabled=1
let g:tex_flavor='latex'
if has('win32')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
else
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_format_enabled=1

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
" === open.vim
" ===
let g:open#image = 'feh'
let g:open#pdf = 'zathura'
let g:open#video = 'vlc'
let g:open#audio = 'vlc'
