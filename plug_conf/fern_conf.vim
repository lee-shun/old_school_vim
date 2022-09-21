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

let g:fern#renderer = "devicons"

augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call s:init_fern()
augroup END
