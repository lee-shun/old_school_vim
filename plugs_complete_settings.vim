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

if g:os_name == 'Linux' || g:os_name == 'Windows'

    " ===
    " === Snippets
    " ===
    let g:UltiSnipsExpandTrigger='<c-y>'
    let g:UltiSnipsJumpForwardTrigger='<tab>'
    let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

    " ===
    " === deoplete
    " ===
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
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

    let g:lsp_diagnostics_signs_error = {'text': 'Ⓔ'}
    let g:lsp_diagnostics_signs_warning = {'text': 'Ⓦ'} " icons require GUI
    let g:lsp_diagnostics_signs_hint = {'text': 'Ⓗ'} " icons require GUI
    let g:lsp_diagnostics_signs_information = {'text': 'Ⓘ'}

    if has('nvim')
        let g:lsp_diagnostics_virtual_text_prefix = "‣ "
        let g:lsp_diagnostics_virtual_text_enabled = 1
    else
        let g:lsp_diagnostics_float_cursor = 0
        let g:lsp_diagnostics_echo_cursor = 1
    endif

    " use the <c-x><c-o> have the popup menu if just use the vim-lsp
    " setlocal omnifunc=lsp#complete

    " ===
    " === vim-lsp-lanuguage-sever
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

endif " if g:os_name == 'Linux' || g:os_name == 'Windows'