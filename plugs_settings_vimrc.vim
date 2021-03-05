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
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material

let g:deus_termcolors=256
let g:SnazzyTransparent = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_x = '%{ScrollStatus()}'
let g:airline_theme = 'material'


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>


" ===
" === Fern.vim
" ===
" map tt :Fern . -drawer -toggle <CR>

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
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  ctermbg=black
"autocmd VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=darkgrey
"
let vim_markdown_preview_github=1
