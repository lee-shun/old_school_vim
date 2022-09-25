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
        if has('nvim')
            silent exec "!google-chrome --password-store=gnome --new-window " . a:url . " &"
        else
            silent exec "AsyncRun! google-chrome --password-store=gnome --new-window " . a:url . " &"
        endif
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'
endif

