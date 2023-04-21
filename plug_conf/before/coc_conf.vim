let g:coc_disable_startup_warning = 1
" coc-plugins
let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-vimtex',
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
            \ 'coc-snippets',
            \ 'coc-lists',
            \ 'coc-marketplace',
            \ 'coc-explorer',
            \ 'coc-translator',
            \ 'coc-spell-checker',
            \ 'coc-syntax',
            \ 'coc-diagnostic',
            \ 'coc-actions',
            \ 'coc-lightbulb',
            \ 'coc-calc',
            \ 'coc-emoji',
            \ 'coc-word',
            \ 'coc-yank',
            \ 'coc-tabnine',
            \ 'coc-floaterm',
            \]
if has('nvim')
    call add(g:coc_global_extensions, 'coc-floatinput')
endif
