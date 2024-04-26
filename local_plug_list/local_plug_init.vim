" rooter
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-rooter"

" use gcc to ..
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-commentary"

" use gsr to..
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-surround"
source $CONF_PATH/plug_conf/before/surround.vim

" auto pairs
let &runtimepath.=','.$CONF_PATH."/local_plug_list/auto-pairs"
let g:AutoPairsMapSpace=0

" ctrlp
let &runtimepath.=','.$CONF_PATH."/local_plug_list/ctrlp.vim"
source $CONF_PATH/plug_conf/after/ctrlp/ctrlp.vim

" term
let &runtimepath.=','.$CONF_PATH."/local_plug_list/split-term.vim"
nnoremap <F12> :<c-u>Term<CR>

" rainbow
let &runtimepath.=','.$CONF_PATH."/local_plug_list/rainbow"
let g:rainbow_active = 1

" yank
let &runtimepath.=','.$CONF_PATH."/local_plug_list/hlyank.vim"

" vimfiler
let &runtimepath.=','.$CONF_PATH."/local_plug_list/unite.vim"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vimfiler.vim"
source $CONF_PATH/plug_conf/before/vimfiler_conf.vim
source $CONF_PATH/plug_conf/after/vimfiler_conf.vim

" git
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-gitgutter"
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-fugitive"

" status line
let &runtimepath.=','.$CONF_PATH."/local_plug_list/skyline.vim"
