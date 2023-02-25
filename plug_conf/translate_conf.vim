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

if has('nvim')
    let s:has_popup = exists('*nvim_win_set_config') && has('nvim-0.4.2')
else
    let s:has_popup = exists('*popup_create') && has('patch-8.2.191')
endif

if !s:has_popup
    let g:translator_window_type='preview'
else
    let g:translator_window_type='popup'
endif

nnoremap <leader>s :TranslateW<CR>
vnoremap <leader>s :TranslateW<CR>

