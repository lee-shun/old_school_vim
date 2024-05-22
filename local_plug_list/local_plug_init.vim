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
let g:AutoPairsMapCh=0

" ctrlp
let &runtimepath.=','.$CONF_PATH."/local_plug_list/ctrlp.vim"
source $CONF_PATH/plug_conf/after/ctrlp/ctrlp.vim

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
let &runtimepath.=','.$CONF_PATH."/local_plug_list/spaceline.vim"
let g:spaceline_colorscheme = 'onehalfdark'
let g:spaceline_seperate_style = 'arrow-fade'
let g:spaceline_diagnostic_errorsign = ' '
let g:spaceline_diagnostic_warnsign = ' '
let g:spaceline_git_branch_icon = ' '
let g:spaceline_custom_diff_icon =  [' ',' ',' ']
let g:spaceline_diff_tool = 'git-gutter'

" vim-mucomplete
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-mucomplete"
source $CONF_PATH/plug_conf/before/mucomplete_conf.vim
source $CONF_PATH/plug_conf/after/mucomplete_conf.vim
