function! s:on_lsp_buffer_enabled() abort
    " use omnifunc if you are fine with it.
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " some mappings to use, tweak as you wish.
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>lr <plug>(lsp-rename)
    nmap <buffer> <leader>la <plug>(lsp-code-action)
    nmap <buffer> gh <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

" call s:on_lsp_buffer_enabled only for languages that has the server registered.
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled() |
            \ hi LspCxxHlGroupMemberVariable ctermfg=LightRed guifg=LightRed  cterm=none gui=none

" command! IDE call lsp#enable()

" ===
" === set up lsp
" ===
if executable('ccls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': {server_info->['ccls']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(
                \ lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(),
                \ ['compile_commands.json', '.vim_root'] ))},
                \ 'initialization_options': {
                \   'highlight': { 'lsRanges' : v:true },
                \ },
                \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
elseif !executable('ccls') && executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '-background-index']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(
                \ lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(),
                \ ['compile_commands.json', '.vim_root'] ))},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
endif

if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
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
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'allowlist': ['python'],
                \ })
endif

if executable('cmake-language-server')
    au User lsp_setup call lsp#register_server({
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

if executable('texlab')
    autocmd User lsp_setup call lsp#register_server({
                \'name': 'texlab',
                \'cmd': {server_info->[expand('texlab')]},
                \'whitelist': ['tex', 'plaintex', 'bib']
                \})
endif

if executable('vim-language-server')
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'vim-language-server',
                \ 'cmd': {server_info->['vim-language-server', '--stdio']},
                \ 'whitelist': ['vim'],
                \ 'initialization_options': {
                \   'vimruntime': $VIMRUNTIME,
                \   'runtimepath': &rtp,
                \ }})
endif
