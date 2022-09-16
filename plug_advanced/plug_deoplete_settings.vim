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
" === deoplete
" ===
function! SetupDeopeleteNvim() abort
    call deoplete#custom#option({
                \ 'auto_complete_delay': 10,
                \ 'smart_case': v:true,
                \ })
    " for latex
    if(exists('g:loaded_vimtex'))
        call deoplete#custom#var('omni', 'input_patterns', {
                    \ 'tex': g:vimtex#re#deoplete
                    \})
    endif
endfunction

augroup SetupDeopeleteNvim
    autocmd!
    autocmd User JetpackDeopeleteNvimPost echom "hello Lazy loaded!"
    autocmd User JetpackDeopeleteNvimPost call SetupDeopeleteNvim()
augroup END
