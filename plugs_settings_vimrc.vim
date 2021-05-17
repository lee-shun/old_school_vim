"**************************************************************************************************
"    __  __        __     _____ __  __ ____   ____
"   |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"   | |\/| | | | |  \ \ / / | || |\/| | |_) | |
"   | |  | | |_| |   \ V /  | || |  | |  _ <| |___
"   |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"           |___/
"
"
"File   : plugs_settings
"
"Author : lee-shun
"
"Email  : 2015097272@qq.com
"
"**************************************************************************************************

"===
"===Pretty Dress
"===

set background=dark
colorscheme sonokai


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

"===
"===rainbow
"===
let g:rainbow_active = 1

" ===
" === indentLine
" ===
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0


"===
"===indent_guides
"===
let g:indent_guides_enable_on_vim_startup = 0

"===
"===markdown
"===
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

"===
"===markdown_preview
"===
let vim_markdown_preview_github=1
