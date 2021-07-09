"**************************************************************************************************
"
"       ___          ___          ___          ___                  ___                   ___
"      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
"     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
"    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
"   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
"  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
"  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
"       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
"        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
"                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
"                   \/__/        \|__|        \/__/                                      \/__/
"
"  Author : lee-shun
"
"  Email  : 2015097272@qq.com
"
"**************************************************************************************************

"===
"===UI
"===
set background=dark
colorscheme everforest
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 1

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

"===
"=== lightline
"===
let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }

"===
"===Fern.vim
"===
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_smart_quit = 1

noremap <silent> <leader>t :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
      nmap <buffer> S <Plug>(fern-action-open:split)
      nmap <buffer> V <Plug>(fern-action-open:vsplit)
      nmap <buffer> R <Plug>(fern-action-rename)
      nmap <buffer> M <Plug>(fern-action-move)
      nmap <buffer> C <Plug>(fern-action-copy)
      nmap <buffer> P <Plug>(fern-action-new-path)
      nmap <buffer> F <Plug>(fern-action-new-file)
      nmap <buffer> D <Plug>(fern-action-new-dir)
      nmap <buffer> H <Plug>(fern-action-hidden-toggle)
      nmap <buffer> T <Plug>(fern-action-trash)
      nmap <buffer> B <Plug>(fern-action-mark)
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
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRUFiles<CR>
nnoremap <leader>fl :CtrlPLine<CR>
