" dein.vim v1.5
let &runtimepath.=','.$CONF_PATH."/local_plug_list/dein.vim_v1.5"
call dein#begin($CONF_PATH.'/local_plug_list/dein')

call dein#add($CONF_PATH.'/local_plug_list/dein.vim_v1.5')
call dein#add($CONF_PATH.'/local_plug_list/vim-rooter')
call dein#add($CONF_PATH.'/local_plug_list/vim-commentary')
call dein#add($CONF_PATH.'/local_plug_list/vim-surround')
call dein#add($CONF_PATH.'/local_plug_list/auto-pairs')
call dein#add($CONF_PATH.'/local_plug_list/ctrlp.vim')
call dein#add($CONF_PATH.'/local_plug_list/rainbow')
call dein#add($CONF_PATH.'/local_plug_list/hlyank.vim')
call dein#add($CONF_PATH.'/local_plug_list/unite.vim')
call dein#add($CONF_PATH.'/local_plug_list/vimfiler.vim')
call dein#add($CONF_PATH.'/local_plug_list/vim-gitgutter')
call dein#add($CONF_PATH.'/local_plug_list/vim-fugitive')
call dein#add($CONF_PATH.'/local_plug_list/spaceline.vim')
call dein#add($CONF_PATH.'/local_plug_list/vim-mucomplete')

call dein#end()

augroup DeinSetup
    autocmd!
    autocmd VimEnter * call dein#call_hook('source') | call dein#call_hook('post_source')
augroup END

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
