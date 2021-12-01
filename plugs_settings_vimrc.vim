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
colorscheme sonokai
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_lightline_disable_bold = 0
let g:sonokai_better_performance = 1

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
            \ 'colorscheme': 'sonokai',
            \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
                \ },
                \ 'component_function': {
                    \   'gitbranch': 'FugitiveHead'
                    \ }
                    \ }

" ===
" === startify
" ===
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

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
" === Translate
" ===
let g:translator_default_engines=['google', 'bing', 'haici', 'youdao']
nnoremap ts :TranslateW<CR>
vnoremap ts :TranslateW<CR>

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
" === Snippets
" ===
" work with deoplete
let g:UltiSnipsExpandTrigger='<c-y>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" ===
" === deoplete
" ===
if g:os_name == 'Linux' || g:os_name == 'Windows'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
            \ 'auto_complete_delay': 10,
            \ 'smart_case': v:true,
            \ })
" for latex
call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

" ===
" === vim-lsp
" ===
" Register ccls C++ lanuage server.
if executable('ccls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': {server_info->['ccls']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                \ 'initialization_options': {
                    \   'highlight': { 'lsRanges' : v:true },
                    \ },
                    \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                    \ })

    hi LspCxxHlGroupMemberVariable ctermfg=LightRed guifg=LightRed  cterm=none gui=none
endif
" Register python lanuage server.
if executable('pyls')
    " pip3 install "python-language-server[all]"
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'allowlist': ['python'],
                \ })
endif

" ===
" === vim-lsp
" ===
let g:lsp_auto_enable = 1
function! s:on_lsp_buffer_enabled() abort
    " use omnifunc if you are fine with it.
    " setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " some mappings to use, tweak as you wish.
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_signs_error = {'text': 'Ⓔ'}
let g:lsp_diagnostics_signs_warning = {'text': 'Ⓦ'} " icons require GUI
let g:lsp_diagnostics_signs_hint = {'text': 'Ⓗ'} " icons require GUI
let g:lsp_diagnostics_signs_information = {'text': 'Ⓘ'}

if has('nvim')
    let g:lsp_diagnostics_virtual_text_prefix = "‣ "
    let g:lsp_diagnostics_virtual_text_enabled = 1
endif

" use the <c-x><c-o> have the popup menu if just use the vim-lsp
" setlocal omnifunc=lsp#complete
endif
