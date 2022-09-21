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
" === vim-lsp
" ===
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_hint = {'text': ''}
let g:lsp_diagnostics_signs_information = {'text': ''}

if has('nvim')
    let g:lsp_diagnostics_virtual_text_prefix = "‣ "
    let g:lsp_diagnostics_virtual_text_enabled = 1
else
    let g:lsp_diagnostics_float_cursor = 0
    let g:lsp_diagnostics_echo_cursor = 1
endif

" use the <c-x><c-o> have the popup menu if just use the vim-lsp
" setlocal omnifunc=lsp#complete
let g:lsp_fold_enabled = 0

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
    nmap <buffer> <leader>ac <plug>(lsp-code-action)
    nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

call s:on_lsp_buffer_enabled()

if executable('ccls')
    call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': {server_info->['ccls']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(
                \ lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(),
                \ ['.vim_root','compile_commands.json'] ))},
                \ 'initialization_options': {
                \   'highlight': { 'lsRanges' : v:true },
                \ },
                \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
elseif !executable('ccls') && executable('clangd')
    call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '-background-index']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(
                \ lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(),
                \ ['.vim_root','compile_commands.json'] ))},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
endif

if executable('pyright-langserver')
    call lsp#register_server({
                \ 'name': 'pyright-langserver',
                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'pyright-langserver --stdio']},
                \ 'allowlist': ['python'],
                \ 'workspace_config': {
                \   'python': {
                \     'analysis': {
                \       'useLibraryCodeForTypes': v:true
                \      },
                \   },
                \ }
                \ })
elseif !executable('pyright-langserver') && executable('pyls')
    " pip3 install "python-language-server[all]"
    call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'allowlist': ['python'],
                \ })
endif

if executable('cmake-language-server')
    call lsp#register_server({
                \ 'name': 'cmake',
                \ 'cmd': {server_info->['cmake-language-server']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(
                \ lsp#utils#get_buffer_path(), 'build/'))},
                \ 'whitelist': ['cmake'],
                \ 'initialization_options': {
                \   'buildDirectory': 'build',
                \ }
                \})
endif

" ===
" === user command
" ===

command! IDE call lsp#enable() |
            \ hi LspCxxHlGroupMemberVariable ctermfg=LightRed guifg=LightRed  cterm=none gui=none
