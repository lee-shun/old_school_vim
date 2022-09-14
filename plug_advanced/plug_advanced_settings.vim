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
" === markdown
" ===
" NOTE: use the plasticboy markdown sytanx file
let g:vim_markdown_math=1
let g:vim_markdown_conceal=1
let g:closetag_html_style=1

" ===
" === markdown_preview.nvim
" ===
if g:os_name == 'Linux' && executable('google-chrome')
    function! g:Open_browser(url)
        " google-chrome  --password-store=gnome
        silent exec "AsyncRun! google-chrome --password-store=gnome --new-window " . a:url . " &"
        " silent exec "!google-chrome --password-store=gnome --new-window " . a:url . " &"
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'
endif

" ===
" === markdown paste image
" ===
let g:mdip_imgdir = 'img'
command! -nargs=0 PastImg :call mdip#MarkdownClipboardImage()


" ===
" === table mode
" ===
let g:table_mode_map_prefix = ',t'

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
