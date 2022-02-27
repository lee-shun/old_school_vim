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
" === Translate
" ===
let g:translator_default_engines=['google', 'bing', 'haici', 'youdao']
nnoremap ts :TranslateW<CR>
vnoremap ts :TranslateW<CR>

" ===
" === Snippets
" ===
let g:UltiSnipsExpandTrigger='<c-y>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'


" ===
" === mkdx
" ===
let g:mkdx#settings = {
            \ 'highlight': { 'enable': 0 },
            \ 'map': { 'prefix': '=' },
            \ 'enter': { 'enable': 1 },
            \ 'fold': { 'enable': 1, 'components': ['toc', 'fence'] }
            \ }

" ===
" === markdown
" ===
" NOTE: use the plasticboy markdown sytanx file
let g:vim_markdown_math=1
let g:vim_markdown_conceal=1
let g:closetag_html_style=1

" ===
" === markdown_preview.nvim
" ===
" google-chrome  --password-store=gnome
function! g:Open_browser(url)
    silent exec "AsyncRun! google-chrome --password-store=gnome --new-window " . a:url . " &"
    " silent exec "!google-chrome --password-store=gnome --new-window " . a:url . " &"
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'

" ===
" === markdown paste image
" ===
let g:mdip_imgdir = 'img'
command! -nargs=0 PastImg :call mdip#MarkdownClipboardImage()

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
" === open.vim
" ===
let g:open#image = 'feh'
let g:open#pdf = 'zathura'
let g:open#video = 'vlc'
let g:open#audio = 'vlc'
