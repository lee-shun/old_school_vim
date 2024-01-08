let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

if g:osv_complete_engine == 'coc'
    let g:vista_default_executive = 'coc'
elseif g:osv_linter == 'ale'
    let g:vista_default_executive = 'ale'
elseif g:osv_lsp == 'vim-lsp'
    let g:vista_default_executive = 'vim_lsp'
elseif g:osv_lsp == 'vim-lsc'
    let g:vista_default_executive = 'vim_lsc'
elseif g:osv_lsp == 'lcn'
    let g:vista_default_executive = 'lcn'
else
    let g:vista_default_executive = 'ctags'
endif
