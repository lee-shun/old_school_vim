" ===
" === settings
" ===

" VE
nnoremap <leader>t :VEToggle<cr>

" ctrlp
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fc :CtrlPChange<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRUFiles<CR>
nnoremap <leader>fo :CtrlPMRUFiles<CR>
nnoremap <leader>fl :CtrlPLine<CR>
nnoremap <leader>fQ :CtrlPQuickfix<CR>


let &runtimepath.=','.$CONF_PATH."/local_plug_list/VimExplorer"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-rooter"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-commentary"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/ctrlp.vim"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-gitgutter"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-fugitive"
