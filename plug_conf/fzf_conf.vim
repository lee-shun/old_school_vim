let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3


nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]f :FzfPreviewProjectFilesRpc<CR>
nnoremap <silent> [fzf-p]m :FzfPreviewMruFilesRpc<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewAllBuffersRpc<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
