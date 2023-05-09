" ===
" === auto save
" ===
let g:auto_save = 1
let g:auto_save_silent = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]

augroup auto_save_file
  au!
  au FileType fern-replacer let b:auto_save = 0
augroup END

