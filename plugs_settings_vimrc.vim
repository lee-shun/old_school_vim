"===
"===Pretty Dress
"===

set background=dark
colorscheme snazzy
let g:SnazzyTransparent = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>


"===
"=== NERDTree-git
"===
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

