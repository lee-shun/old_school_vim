" dein.vim v1.5
let &runtimepath.=','.$CONF_PATH."/local_plug_list/dein.vim_v1.5"

call dein#begin($CONF_PATH.'/local_plug_list/dein_cache')

call dein#add($CONF_PATH.'/local_plug_list/dein.vim_v1.5')

call dein#add($CONF_PATH.'/local_plug_list/vim-rooter', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rooter_conf.vim',
            \})

call dein#add($CONF_PATH.'/local_plug_list/vim-commentary', {'lazy':1,
            \'on_map':{'n':'gcc', 'v':'gc'},
            \})

call dein#add($CONF_PATH.'/local_plug_list/vim-auto-save', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/auto_save_conf.vim'
            \})

call dein#add($CONF_PATH.'/local_plug_list/vim-surround', {'lazy':1,
            \'on_map':{'n':['gs', 'gS']},
            \'hook_source':'source $CONF_PATH/plug_conf/before/surround.vim'
            \})

call dein#add($CONF_PATH.'/local_plug_list/auto-pairs', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'let g:AutoPairsMapSpace=0 | let g:AutoPairsMapCh=0'
            \})

call dein#add($CONF_PATH.'/local_plug_list/ctrlp.vim', {'lazy':1,
            \'on_map':{'n':'<leader>f'},
            \'on_cmd':['CtrlP'],
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/ctrlp/ctrlp.vim '
            \})

call dein#add($CONF_PATH.'/local_plug_list/rainbow', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rainbow_conf.vim'
            \})

call dein#add($CONF_PATH.'/local_plug_list/hlyank.vim', {'lazy':1,
            \'on_event': ['TextYankPost'],
            \})

call dein#add($CONF_PATH.'/local_plug_list/unite.vim', {'lazy':1,
            \})

call dein#add($CONF_PATH.'/local_plug_list/vimfiler.vim',{'lazy':1,
            \'on_map':'<leader>t',
            \'on_cmd':['VimFiler', 'VimFilerCurrentDir'],
            \'depends':['unite.vim'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vimfiler_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/vimfiler_conf.vim'
            \})

call dein#add($CONF_PATH.'/local_plug_list/vim-gitgutter')
call dein#add($CONF_PATH.'/local_plug_list/vim-fugitive')

call dein#add($CONF_PATH.'/local_plug_list/spaceline.vim')

call dein#add($CONF_PATH.'/local_plug_list/vim-mucomplete', {'lazy':1,
            \'on_event': ['BufNewFile', 'BufReadPre', 'BufNew', 'BufEnter'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/mucomplete_conf.vim',
            \'hook_post_source':'source $CONF_PATH/plug_conf/after/mucomplete_conf.vim'
            \})

call dein#end()

" status line
let g:spaceline_colorscheme = 'onehalfdark'
let g:spaceline_seperate_style = 'arrow-fade'
let g:spaceline_diagnostic_errorsign = ' '
let g:spaceline_diagnostic_warnsign = ' '
let g:spaceline_git_branch_icon = ' '
let g:spaceline_custom_diff_icon =  [' ',' ',' ']
let g:spaceline_diff_tool = 'git-gutter'
