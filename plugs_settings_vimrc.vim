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

"===
"=== lightline
"===
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ===
" === NERDTree
" ===
noremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25              " 设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1             " 开启Nerdtree时自动显示Bookmarks
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHidden=0                  " 不显示隐藏文件
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
" let g:NERDTreeShowLineNumbers=1  " 是否显示行号

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
"===Fern.vim
"===
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1

noremap <silent> <leader>t :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
      nmap <buffer> H <Plug>(fern-action-open:split)
      nmap <buffer> V <Plug>(fern-action-open:vsplit)
      nmap <buffer> R <Plug>(fern-action-rename)
      nmap <buffer> M <Plug>(fern-action-move)
      nmap <buffer> C <Plug>(fern-action-copy)
      nmap <buffer> N <Plug>(fern-action-new-path)
      nmap <buffer> T <Plug>(fern-action-new-file)
      nmap <buffer> D <Plug>(fern-action-new-dir)
      nmap <buffer> S <Plug>(fern-action-hidden-toggle)
      nmap <buffer> dd <Plug>(fern-action-trash)
      nmap <buffer> <leader> <Plug>(fern-action-mark)
endfunction

augroup fern-custom
      autocmd! *
      autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"

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

"===
"===ctrl-p
"===
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|plugged)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$' }
