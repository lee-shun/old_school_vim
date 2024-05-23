" vim-plug
let &runtimepath.=','.$CONF_PATH."/local_plug_list/vim-plug"

call plug#begin($CONF_PATH.'/local_plug_list')

Plug $CONF_PATH.'/local_plug_list/vim-rooter'

Plug $CONF_PATH.'/local_plug_list/vim-commentary'
Plug $CONF_PATH.'/local_plug_list/vim-surround'
Plug $CONF_PATH.'/local_plug_list/auto-pairs'

Plug $CONF_PATH.'/local_plug_list/ctrlp.vim'

Plug $CONF_PATH.'/local_plug_list/rainbow'
Plug $CONF_PATH.'/local_plug_list/hlyank.vim'

Plug $CONF_PATH.'/local_plug_list/unite.vim'
Plug $CONF_PATH.'/local_plug_list/vimfiler.vim'

Plug $CONF_PATH.'/local_plug_list/vim-gitgutter'
Plug $CONF_PATH.'/local_plug_list/vim-fugitive'

Plug $CONF_PATH.'/local_plug_list/spaceline.vim'

Plug $CONF_PATH.'/local_plug_list/vim-mucomplete'

call plug#end()

" use gsr to..
source $CONF_PATH/plug_conf/before/surround.vim

" auto pairs
let g:AutoPairsMapSpace=0
let g:AutoPairsMapCh=0

" ctrlp
source $CONF_PATH/plug_conf/after/ctrlp/ctrlp.vim

" rainbow
let g:rainbow_active = 1

" vimfiler
source $CONF_PATH/plug_conf/before/vimfiler_conf.vim
source $CONF_PATH/plug_conf/after/vimfiler_conf.vim

" status line
let g:spaceline_colorscheme = 'onehalfdark'
let g:spaceline_seperate_style = 'arrow-fade'
let g:spaceline_diagnostic_errorsign = ' '
let g:spaceline_diagnostic_warnsign = ' '
let g:spaceline_git_branch_icon = ' '
let g:spaceline_custom_diff_icon =  [' ',' ',' ']
let g:spaceline_diff_tool = 'git-gutter'

" vim-mucomplete
source $CONF_PATH/plug_conf/before/mucomplete_conf.vim
source $CONF_PATH/plug_conf/after/mucomplete_conf.vim
