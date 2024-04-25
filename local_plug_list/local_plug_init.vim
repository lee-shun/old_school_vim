" let &runtimepath.=','.$CONF_PATH."/local_plug_list/VimExplorer"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-rooter"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-commentary"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/ctrlp.vim"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-gitgutter"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-fugitive"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/split-term.vim"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/rainbow"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/unite.vim"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vimfiler.vim"


" ===
" === settings
" ===

" ctrlp
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fc :CtrlPChange<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRUFiles<CR>
nnoremap <leader>fo :CtrlPMRUFiles<CR>
nnoremap <leader>fl :CtrlPLine<CR>
nnoremap <leader>fQ :CtrlPQuickfix<CR>

" term
nnoremap <F12> :<c-u>Term<CR>

" rainbow
let g:rainbow_active = 1

" vimfiler
source $CONF_PATH/plug_conf/before/vimfiler_conf.vim
source $CONF_PATH/plug_conf/after/vimfiler_conf.vim
