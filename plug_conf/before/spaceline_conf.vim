let g:spaceline_colorscheme = 'nord'
let g:spaceline_seperate_style = 'arrow-fade'
let g:spaceline_diagnostic_errorsign = ' '
let g:spaceline_diagnostic_warnsign = ' '
let g:spaceline_git_branch_icon = ' '
let g:spaceline_custom_diff_icon =  [' ',' ',' ']

let g:spaceline_diff_tool = 'vim-signify'

if g:osv_complete_engine == 'coc'
    let g:spaceline_diagnostic_tool = 'coc'
elseif g:osv_vim_lsp == 1
    let g:spaceline_diagnostic_tool = 'ale'
endif
