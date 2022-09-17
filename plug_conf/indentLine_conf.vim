" ===
" === indentLine
" ===
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_bgcolor_term = 237
let g:indentLine_leadingSpaceChar = '·'
augroup auto_indentline_ft
    autocmd!
    autocmd FileType vim IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType tex IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType cpp IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType c IndentLinesEnable | LeadingSpaceEnable
    autocmd FileType python IndentLinesEnable | LeadingSpaceEnable
augroup END

