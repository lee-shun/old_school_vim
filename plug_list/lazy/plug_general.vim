call dein#add('haya14busa/dein-command.vim', {
            \'on_cmd':'Dein'
            \})

call dein#add('tpope/vim-fugitive', {'lazy':1})

call dein#add('mhinz/vim-signify', {'lazy':1,
            \'on_event': ['BufReadPost'], })

let s:spaceline_conf = {'lazy':1,
            \'on_event':['BufReadPost'],
            \'depends':['vim-signify', 'vim-devicons'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/spaceline_conf.vim'}
if g:osv_complete_engine == 'coc'
    call add(s:spaceline_conf.depends, 'coc.nvim')
endif
if g:osv_plug_lsp == 1
    call add(s:spaceline_conf.depends, 'vim-lsp-ale')
endif
call dein#add('lee-shun/spaceline.vim', s:spaceline_conf)

call dein#add('luochen1990/rainbow', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rainbow_conf.vim'})

call dein#add('Yggdroot/indentLine', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/indentLine_conf.vim'})

call dein#add('bronson/vim-trailing-whitespace', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/whitespace_conf.vim'
            \})

call dein#add('RRethy/vim-illuminate', {'lazy':1,
            \'on_event' : ['BufReadPost'] })

call dein#add('voldikss/vim-floaterm', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/floaterm_conf.vim'})

call dein#add('chrisbra/Colorizer', {'lazy':1,
            \'on_cmd':['ColorToggle']
            \})

call dein#add('rlue/vim-barbaric', {'lazy':1,
            \'on_event':['InsertEnter'],
            \})

call dein#add('sakshamgupta05/vim-todo-highlight', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/todo_hl_conf.vim' })

call dein#add('junegunn/vim-peekaboo', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call dein#add('airblade/vim-rooter', {'lazy':1,
            \'on_event': ['BufRead'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rooter_conf.vim'
            \})

call dein#add('tpope/vim-surround', {'lazy':1,
            \'on_map':{'n':['gs', 'gS']},
            \'hook_source':'source $CONF_PATH/plug_conf/before/surround.vim'
            \})

call dein#add('tpope/vim-repeat', {'lazy':1,
            \'on_map':{'n':'.'},
            \})

call dein#add('tpope/vim-commentary', {'lazy':1,
            \'on_map':{'n':'gcc', 'v':'gc'},
            \})

if !has('nvim') && v:version< 802
    call dein#add('jiangmiao/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'let g:AutoPairsMapSpace=0'
                \})
else " this new auto-pair need neovim or vim 8.2
    call dein#add('LunarWatcher/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'let g:AutoPairsMapSpace=0'
                \})
endif

call dein#add('machakann/vim-highlightedyank', {'lazy':1,
            \'on_event': ['TextYankPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/hlightedyank_conf.vim'
            \})

call dein#add('tpope/vim-speeddating', {'lazy':1,
            \'on_map': {'n':['<C-a>', '<C-x>']}
            \})

call dein#add('junegunn/vim-easy-align', {'lazy':1,
            \'on_map': {'n':'ga', 'v':'ga'},
            \'hook_post_source': 'source $CONF_PATH/plug_conf/after/easy_align_conf.vim'
            \})

call dein#add('preservim/vim-pencil', {'lazy':1,
            \'on_cmd':['Pencil', 'NoPencil', 'PencilOff', 'TogglePencil',
            \'PencilToggle', 'SoftPencil', 'PencilSoft', 'HardPencil', 'PencilHard'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/pencil_conf.vim'
            \})

call dein#add('mg979/vim-visual-multi', {'lazy':1,
            \'on_map': {'n':'<C-n>', 'v':'<C-n>'},
            \'hook_source':'source $CONF_PATH/plug_conf/before/visual_multi_conf.vim'
            \})

call dein#add('907th/vim-auto-save', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/auto_save_conf.vim'
            \})

call dein#add('lambdalisue/readablefold.vim', {'lazy':1,
            \'on_map':'z',
            \})

call dein#add('wellle/targets.vim', {'lazy':1,
            \'on_event': ['BufReadPost']
            \})

call dein#add('kana/vim-textobj-user', {'lazy':1,
            \})

call dein#add('thinca/vim-textobj-between', {'lazy':1,
            \'depends': ['vim-textobj-user'],
            \'on_event': ['BufReadPost']
            \})

call dein#add('mbbill/undotree', {'lazy':1,
            \'on_cmd':['UndotreeToggle']
            \})

if !has('nvim')
    call dein#add('skywind3000/asyncrun.vim', {'lazy':1,
                \'on_event': ['BufReadPost']
                \})
    call dein#add('skywind3000/asynctasks.vim', {'lazy':1,
                \'depedns':['asyncrun.vim'],
                \'on_event': ['BufReadPost'],
                \})
endif

call dein#add('rhysd/conflict-marker.vim', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call dein#add('brooth/far.vim', {
            \'lazy':1,
            \'on_cmd':['F', 'Far', 'Farr',  'Farf', 'Fardo', 'Refar', 'Farundo'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/far_conf.vim'
            \})
