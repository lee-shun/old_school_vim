" coc-plugins
let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-texlab',
            \ 'coc-bibtex',
            \ 'coc-sh',
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-java',
            \ 'coc-markdownlint',
            \ 'coc-markmap',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-xml',
            \ 'coc-yaml',
            \ 'coc-vimlsp',
            \ 'coc-git',
            \ 'coc-marketplace',
            \ 'coc-translator',
            \ 'coc-spell-checker',
            \ 'coc-syntax',
            \ 'coc-diagnostic',
            \ 'coc-calc',
            \ 'coc-emoji',
            \ 'coc-word',
            \ 'coc-yank',
            \ 'coc-floaterm',
            \]

if g:osv_finder == 'coc-lists'
    call add(g:coc_global_extensions, 'coc-lists')
endif

if g:osv_snip == 'coc-snippets'
    call add(g:coc_global_extensions, 'coc-snippets')
endif

if g:osv_file_explorer == 'coc-explorer'
    call add(g:coc_global_extensions, 'coc-explorer')
endif

if has('nvim')
    call add(g:coc_global_extensions, 'coc-floatinput')
endif

if g:os_architect != 'aarch64'
    " these 2 coc plugins are not supported by aarch64
    call add(g:coc_global_extensions, 'coc-lightbulb')
    call add(g:coc_global_extensions, 'coc-tabnine')
endif

let g:coc_disable_startup_warning = 1
