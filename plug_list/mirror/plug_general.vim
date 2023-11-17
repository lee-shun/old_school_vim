call dein#add('lee-shun/vim-devicons', {'lazy':1})

call dein#add('lee-shun/dein-command.vim', {
            \'on_event':["CmdlineEnter", "CmdwinEnter"],
            \})

if has('nvim') && !has('nvim-0.8')
    call dein#add('lee-shun/FixCursorHold.nvim')
endif

if has('nvim') || v:version > 800 " nvim still need this 2 plugins
    call dein#add('lee-shun/vim-hug-neovim-rpc', {'lazy':1})
    call dein#add('lee-shun/nvim-yarp', {'lazy':1,
                \'depends':'vim-hug-neovim-rpc'
                \})
endif

if v:version > 800 || has('nvim-0.3')
    call dein#add('lee-shun/wilder.nvim', {'lazy':1,
                \'on_event':["CmdlineEnter", "CmdwinEnter"],
                \'depends':['nvim-yarp', 'vim-hug-neovim-rpc'],
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/wilder_conf.vim',
                \})
endif

if g:osv_finder == 'none' || g:osv_finder == 'coc-lists' || v:version < 800
    call dein#add('lee-shun/vim-startify', { 'lazy':1,
                \'on_event':'VimEnter',
                \'depends':['vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_startify_conf.vim',
                \})
else
    let s:vim_dashboard_config = { 'lazy':1,
                \'on_event':'VimEnter',
                \'depends':['vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_dashboard_conf.vim',
                \}
    call dein#add('lee-shun/vim-dashboard', s:vim_dashboard_config)
endif

call dein#add('lee-shun/vim-fugitive', {'lazy':1})

if has('nvim') || has('patch-8.0.902')
    call dein#add('lee-shun/vim-signify', {'lazy':1,
                \'on_event': ['BufReadPost'], })
else
    call dein#add('lee-shun/vim-signify', {'lazy':1,
                \'on_event': ['BufReadPost'],
                \'rev':'legacy'})
endif

call dein#add('lee-shun/rainbow', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rainbow_conf.vim'})

call dein#add('lee-shun/indentLine', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/indentLine_conf.vim'})

call dein#add('lee-shun/vim-trailing-whitespace', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/whitespace_conf.vim'
            \})

call dein#add('lee-shun/vim-illuminate', {'lazy':1,
            \'on_event' : ['BufReadPost'] })

if exists(':terminal')
    call dein#add('lee-shun/vim-floaterm', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/floaterm_conf.vim'})
endif

call dein#add('lee-shun/Colorizer', {'lazy':1,
            \'on_cmd':['ColorToggle']
            \})

call dein#add('lee-shun/vim-todo-highlight', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/todo_hl_conf.vim' })

call dein#add('lee-shun/vim-peekaboo', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call dein#add('lee-shun/vim-rooter', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rooter_conf.vim',
            \})

call dein#add('lee-shun/vim-surround', {'lazy':1,
            \'on_map':{'n':['gs', 'gS']},
            \'hook_source':'source $CONF_PATH/plug_conf/before/surround.vim'
            \})

call dein#add('lee-shun/vim-repeat', {'lazy':1,
            \'on_event':['BufReadPost'],
            \})

call dein#add('lee-shun/vim-commentary', {'lazy':1,
            \'on_map':{'n':'gcc', 'v':'gc'},
            \})

if !has('nvim') && v:version< 802
    call dein#add('lee-shun/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'let g:AutoPairsMapSpace=0'
                \})
else " this new auto-pair need neovim or vim 8.2
    call dein#add('lee-shun/auto-pairs-new', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'let g:AutoPairsMapSpace=0'
                \})
endif

call dein#add('lee-shun/hlyank.vim', {'lazy':1,
            \'on_event': ['TextYankPost'],
            \})

call dein#add('lee-shun/vim-speeddating', {'lazy':1,
            \'on_map': {'n':['<C-a>', '<C-x>']}
            \})

call dein#add('lee-shun/vim-easy-align', {'lazy':1,
            \'on_map': {'n':'ga', 'v':'ga'},
            \'hook_post_source': 'source $CONF_PATH/plug_conf/after/easy_align_conf.vim'
            \})

call dein#add('lee-shun/vim-pencil', {'lazy':1,
            \'on_cmd':['Pencil', 'NoPencil', 'PencilOff', 'TogglePencil',
            \'PencilToggle', 'SoftPencil', 'PencilSoft', 'HardPencil', 'PencilHard'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/pencil_conf.vim'
            \})

call dein#add('lee-shun/vim-visual-multi', {'lazy':1,
            \'on_map': {'n':'<C-n>', 'v':'<C-n>'},
            \'hook_source':'source $CONF_PATH/plug_conf/before/visual_multi_conf.vim'
            \})

call dein#add('lee-shun/vim-auto-save', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/auto_save_conf.vim'
            \})

call dein#add('lee-shun/readablefold.vim', {'lazy':1,
            \'on_map':'z',
            \})

call dein#add('lee-shun/targets.vim', {'lazy':1,
            \'on_event': ['BufReadPost']
            \})

call dein#add('lee-shun/vim-textobj-user', {'lazy':1,
            \})

call dein#add('lee-shun/vim-textobj-between', {'lazy':1,
            \'depends': ['vim-textobj-user'],
            \'on_event': ['BufReadPost']
            \})

call dein#add('lee-shun/undotree', {'lazy':1,
            \'on_cmd':['UndotreeToggle']
            \})

if !has('nvim')
    call dein#add('lee-shun/asyncrun.vim', {'lazy':1,
                \'on_event': ['BufReadPost']
                \})
    call dein#add('lee-shun/asynctasks.vim', {'lazy':1,
                \'depedns':['asyncrun.vim'],
                \'on_event': ['BufReadPost'],
                \})
endif

call dein#add('lee-shun/conflict-marker.vim', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call dein#add('lee-shun/far.vim', {
            \'lazy':1,
            \'on_cmd':['F', 'Far', 'Farr',  'Farf', 'Fardo', 'Refar', 'Farundo'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/far_conf.vim'
            \})

" plugins for nvim and vim > 8.0
if v:version >= 800 || has('nvim')
    let s:spaceline_conf = {'lazy':1,
                \'on_event': ['BufNewFile', 'BufReadPost'],
                \'depends':['vim-signify', 'vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/spaceline_conf.vim'}
    if g:osv_complete_engine == 'coc'
        call add(s:spaceline_conf.depends, 'coc.nvim')
    endif
    if g:osv_linter == 'ale'
        call add(s:spaceline_conf.depends, 'ale')
    endif
    call dein#add('lee-shun/spaceline.vim', s:spaceline_conf)

    " do not enable in under the ssh connetction.
    " only works if fcitx or fcitx5 is available.
    if g:os_name == 'Linux' && (osv_ultis#system#exec(["echo $SSH_CLIENT"]) is# '')
        if executable('fcitx-remote')
            call dein#add('lee-shun/vim-barbaric', {'lazy':1,
                        \'on_event':['InsertEnter'],
                        \'hook_source':'let g:barbaric_fcitx_cmd = "fcitx-remote"',
                        \})
        elseif executable('fcitx5-remote')
            call dein#add('lee-shun/vim-barbaric', {'lazy':1,
                        \'on_event':['InsertEnter'],
                        \'hook_source':'let g:barbaric_fcitx_cmd = "fcitx5-remote"',
                        \})
        endif
    endif
endif
