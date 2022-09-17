call dein#add('lambdalisue/nerdfont.vim', {'lazy':1})

call dein#add('ryanoasis/vim-devicons', {'lazy':1})

call dein#add('tpope/vim-fugitive', {'lazy':1})

call dein#add('niklaas/lightline-gitdiff', {'lazy':1})

call dein#add('itchyny/lightline.vim', {'lazy':1,
            \'depends':['lightline-gitdiff', 'vim-fugitive'],
            \'on_event':['BufReadPre'],
            \'hook_add':'source $CONF_PATH/plug_conf/lightline_conf.vim'})

call dein#add('luochen1990/rainbow', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_add':'let g:rainbow_active = 1'})

call dein#add('Yggdroot/indentLine', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_add':'source $CONF_PATH/plug_conf/indentLine_conf.vim'})

call dein#add('RRethy/vim-illuminate', {'lazy':1,
            \'on_event' : ['BufReadPost'] })

call dein#add('voldikss/vim-floaterm', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_add':'source $CONF_PATH/plug_conf/floaterm_conf.vim'})

call dein#add('lambdalisue/fern-renderer-nerdfont.vim', {'lazy':1})

call dein#add('lambdalisue/fern-git-status.vim', {'lazy':1,
            \'hook_post_source':'source $CONF_PATH/plug_conf/fern_git_conf.vim' })

call dein#add('lambdalisue/fern.vim', {'lazy':1,
            \'depends':['fern-git-status.vim','fern-renderer-nerdfont.vim'],
            \'on_event':['BufReadPost'],
            \'on_map':{'n':'<leader>t'},
            \'hook_post_source':'source $CONF_PATH/plug_conf/fern_conf.vim'})

call dein#add('airblade/vim-rooter', {'lazy':1,
            \'on_event' : ['BufReadPost'],
            \'hook_add' : 'source $CONF_PATH/plug_conf/vim_rooter_conf.vim'})

call dein#add('Yggdroot/LeaderF', {'lazy':1,
            \'on_map' : {'n':'<leader>f'},
            \'hook_add' : 'source $CONF_PATH/plug_conf/leaderF_conf.vim'})

call dein#add('chrisbra/Colorizer', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'on_cmd':['ColorToggle'], })

call dein#add('sakshamgupta05/vim-todo-highlight', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_add': 'source $CONF_PATH/plug_conf/todo_hl_conf.vim' })

call dein#add('junegunn/vim-peekaboo', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'on_map': {'i':'<C-r>', 'n':'"'}})

call dein#add('tpope/vim-speeddating', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'on_map': {'n':'<C-a>'}})

call dein#add('junegunn/vim-easy-align', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'on_map': '<Plug>(EasyAlign)',
            \'hook_add': 'source $CONF_PATH/plug_conf/easy_align_conf.vim'})

call dein#add('mg979/vim-visual-multi', {'lazy':1,
            \'on_map': {'n':'<C-n>'}})

call dein#add('907th/vim-auto-save', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_add': 'source $CONF_PATH/plug_conf/auto_save_conf.vim'})

call dein#add('lambdalisue/readablefold.vim', {'lazy':1,
            \'on_event': ['BufReadPost']})

call dein#add('wellle/targets.vim', {'lazy':1,
            \'on_event': ['BufReadPost']})

call dein#add('kana/vim-textobj-user', {'lazy':1,})

call dein#add('thinca/vim-textobj-between', {'lazy':1,
            \'depends': ['vim-textobj-user'],
            \'on_event': ['BufReadPost']})

call dein#add('mbbill/undotree', {'lazy':1,
            \'on_cmd':['UndotreeToggle']})

call dein#add('skywind3000/asyncrun.vim', {'lazy':1,
            \'on_event': ['BufReadPost']})

call dein#add('skywind3000/asynctasks.vim', {'lazy':1,
            \'depedns':['asyncrun.vim'],
            \'on_event': ['BufReadPost'],})

call dein#add('mhinz/vim-signify', {'lazy':1,
            \'on_event': ['BufReadPost'], })

call dein#add('rhysd/conflict-marker.vim', {'lazy':1,
            \'on_event': ['BufReadPost'], })
