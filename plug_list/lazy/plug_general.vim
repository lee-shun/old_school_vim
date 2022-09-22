"*******************************************************************************
"                                                                              "
"          .oOOOo.   o      o       .oOOOo.         o                 o        "
"         .O     o. O      O        o     o        O                 O         "
"         O       o o      o        O.             o                 o         "
"         o       O O      o         `OOoo.        O                 O         "
"         O       o o  .oOoO              `O .oOo  OoOo. .oOo. .oOo. o         "
"         o       O O  o   O               o O     o   o O   o O   o O         "
"         `o     O' o  O   o        O.    .O o     o   O o   O o   O o         "
"          `OoooO'  Oo `OoO'o        `oooO'  `OoO' O   o `OoO' `OoO' Oo        "
"                                                                              "
"  Author : lee-shun                                                           "
"                                                                              "
"  Email  : 2015097272@qq.com                                                  "
"                                                                              "
"*******************************************************************************

call dein#add('roxma/nvim-yarp', {'lazy':1})
call dein#add('roxma/vim-hug-neovim-rpc',{'lazy':1})

call dein#add('tpope/vim-fugitive', {'lazy':1})

call dein#add('niklaas/lightline-gitdiff', {'lazy':1})
call dein#add('itchyny/lightline.vim', {'lazy':1,
            \'depends':['lightline-gitdiff', 'vim-fugitive', 'custom_colorscheme'],
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

if g:old_school_vim_plug_coc == 0

    call dein#add('kristijanhusak/defx-git', {'lazy':1,
                \'hook_add':'source $CONF_PATH/plug_conf/defx_git_config.vim'})
    call dein#add('kristijanhusak/defx-icons', {'lazy':1,
                \'depends':'vim-devicons',
                \'hook_add':'source $CONF_PATH/plug_conf/defx_icons_conf.vim'})

    let g:defx_nvim_config = {'lazy':1,
                \'on_cmd':'Defx',
                \'on_map':'<leader>t',
                \'depends':['nvim-yarp', 'vim-hug-neovim-rpc', 'defx-git', 'defx-icons'],
                \'hook_post_source':'source $CONF_PATH/plug_conf/defx_conf.vim',
                \'hook_done_update': ''}
    if has('nvim')
        let g:defx_nvim_config.hook_done_update = 'UpdateRemotePlugins'
    endif

    call dein#add('Shougo/defx.nvim', g:defx_nvim_config)
endif

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
            \'on_map': {'n':'<C-n>', 'v':'<C-n>'}})

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
