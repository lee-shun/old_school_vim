let start_t = reltime()
call osv_ultis#plug#add('ryanoasis/vim-devicons', {'lazy':1})

call osv_ultis#plug#add('haya14busa/dein-command.vim', {
            \'on_event':["CmdlineEnter", "CmdwinEnter"],
            \})

if has('nvim') && !has('nvim-0.8')
    call osv_ultis#plug#add('antoinemadec/FixCursorHold.nvim')
endif

if osv_ultis#check_env#check_vim_ver(800) || osv_ultis#check_env#check_nvim_ver('nvim')
    call osv_ultis#plug#add('roxma/vim-hug-neovim-rpc', {'lazy':1})
    call osv_ultis#plug#add('roxma/nvim-yarp', {'lazy':1,
                \'depends':'vim-hug-neovim-rpc'
                \})
endif

if osv_ultis#check_env#check_vim_ver(900)
    call osv_ultis#plug#add('girishji/autosuggest.vim', {'lazy':1,
                \'on_event':["CmdlineEnter", "CmdwinEnter"],
                \'hook_post_source':'AutoSuggestEnable',
                \})
elseif osv_ultis#check_env#check_vim_ver(800) || osv_ultis#check_env#check_nvim_ver('nvim-0.3.0') && has('python3')
    call osv_ultis#plug#add('gelguy/wilder.nvim', {'lazy':1,
                \'on_event':["CmdlineEnter", "CmdwinEnter"],
                \'depends':['nvim-yarp', 'vim-hug-neovim-rpc'],
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/wilder_conf.vim',
                \})
else
    call osv_ultis#plug#add('vim-scripts/sherlock.vim', {'lazy':1,
                \'on_event':["CmdlineEnter", "CmdwinEnter"],
                \})
endif

if index(['fzf', 'leaderf', 'ctrlp', 'clap', 'fuzzyy'], g:osv_finder) != -1 &&
            \(osv_ultis#check_env#check_vim_ver(800) || osv_ultis#check_env#check_nvim_ver('nvim'))
    let s:vim_dashboard_config = { 'lazy':1,
                \'on_event':'VimEnter',
                \'depends':['vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_dashboard_conf.vim',
                \}
    call osv_ultis#plug#add('lee-shun/vim-dashboard', s:vim_dashboard_config)
else
    call osv_ultis#plug#add('mhinz/vim-startify', { 'lazy':1,
                \'on_event':'VimEnter',
                \'depends':['vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/vim_startify_conf.vim',
                \})
endif

call osv_ultis#plug#add('tpope/vim-fugitive', {'lazy':1})

if osv_ultis#check_env#check_vim_patch('patch-8.0.0902') || osv_ultis#check_env#check_nvim_ver('nvim')
    call osv_ultis#plug#add('mhinz/vim-signify', {'lazy':1,
                \'on_event': ['BufReadPost'], })
else
    call osv_ultis#plug#add('mhinz/vim-signify', {'lazy':1,
                \'on_event': ['BufReadPost'],
                \'rev':'legacy'})
endif

call osv_ultis#plug#add('luochen1990/rainbow', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rainbow_conf.vim'
            \})

call osv_ultis#plug#add('Yggdroot/indentLine', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/indentLine_conf.vim'
            \})

call osv_ultis#plug#add('bronson/vim-trailing-whitespace', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/whitespace_conf.vim'
            \})

call osv_ultis#plug#add('RRethy/vim-illuminate', {'lazy':1,
            \'on_event' : ['BufReadPost']
            \})

if exists(':terminal')
    call osv_ultis#plug#add('voldikss/vim-floaterm', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/floaterm_conf.vim'
                \})
endif

call osv_ultis#plug#add('chrisbra/Colorizer', {'lazy':1,
            \'on_cmd':['ColorToggle']
            \})

call osv_ultis#plug#add('sakshamgupta05/vim-todo-highlight', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/todo_hl_conf.vim' })

call osv_ultis#plug#add('junegunn/vim-peekaboo', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call osv_ultis#plug#add('airblade/vim-rooter', {'lazy':1,
            \'on_event': ['BufRead'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/rooter_conf.vim',
            \})

call osv_ultis#plug#add('tpope/vim-surround', {'lazy':1,
            \'on_map':{'n':['gs', 'gS']},
            \'hook_source':'source $CONF_PATH/plug_conf/before/surround.vim'
            \})

call osv_ultis#plug#add('tpope/vim-repeat', {'lazy':1,
            \'on_event':['BufReadPost'],
            \})

call osv_ultis#plug#add('tpope/vim-commentary', {'lazy':1,
            \'on_map':{'n':'gcc', 'v':'gc'},
            \})

if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim')
    call osv_ultis#plug#add('jiangmiao/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'let g:AutoPairsMapSpace=0 | let g:AutoPairsMapCh=0'
                \})
else " this new auto-pair need neovim or vim 8.2
    call osv_ultis#plug#add('LunarWatcher/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_source':'let g:AutoPairsMapSpace=0 | let g:AutoPairsMapCh=0'
                \})
endif

call osv_ultis#plug#add('markonm/hlyank.vim', {'lazy':1,
            \'on_event': ['TextYankPost'],
            \})

call osv_ultis#plug#add('tpope/vim-speeddating', {'lazy':1,
            \'on_map': {'n':['<C-a>', '<C-x>']}
            \})

call osv_ultis#plug#add('junegunn/vim-easy-align', {'lazy':1,
            \'on_map': {'n':'ga', 'v':'ga'},
            \'hook_post_source': 'source $CONF_PATH/plug_conf/after/easy_align_conf.vim'
            \})

call osv_ultis#plug#add('preservim/vim-pencil', {'lazy':1,
            \'on_cmd':['Pencil', 'NoPencil', 'PencilOff', 'TogglePencil',
            \'PencilToggle', 'SoftPencil', 'PencilSoft', 'HardPencil', 'PencilHard'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/pencil_conf.vim'
            \})

call osv_ultis#plug#add('mg979/vim-visual-multi', {'lazy':1,
            \'on_map': {'n':'<C-n>', 'v':'<C-n>'},
            \'hook_source':'source $CONF_PATH/plug_conf/before/visual_multi_conf.vim'
            \})

call osv_ultis#plug#add('907th/vim-auto-save', {'lazy':1,
            \'on_event': ['InsertLeave', 'TextChanged'],
            \'hook_source': 'source $CONF_PATH/plug_conf/before/auto_save_conf.vim'
            \})

call osv_ultis#plug#add('lambdalisue/readablefold.vim', {'lazy':1,
            \'on_map':'z',
            \})

call osv_ultis#plug#add('wellle/targets.vim', {'lazy':1,
            \'on_event': ['BufReadPost']
            \})

call osv_ultis#plug#add('kana/vim-textobj-user', {'lazy':1,
            \})

call osv_ultis#plug#add('thinca/vim-textobj-between', {'lazy':1,
            \'depends': ['vim-textobj-user'],
            \'on_event': ['BufReadPost']
            \})

call osv_ultis#plug#add('mbbill/undotree', {'lazy':1,
            \'on_cmd':['UndotreeToggle']
            \})

if !has('nvim')
    call osv_ultis#plug#add('skywind3000/asyncrun.vim', {'lazy':1,
                \'on_event': ['BufReadPost']
                \})
    call osv_ultis#plug#add('skywind3000/asynctasks.vim', {'lazy':1,
                \'depedns':['asyncrun.vim'],
                \'on_event': ['BufReadPost'],
                \})
endif

call osv_ultis#plug#add('rhysd/conflict-marker.vim', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call osv_ultis#plug#add('brooth/far.vim', {
            \'lazy':1,
            \'on_cmd':['F', 'Far', 'Farr',  'Farf', 'Fardo', 'Refar', 'Farundo'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/far_conf.vim'
            \})

" plugins for nvim and vim > 8.0
if osv_ultis#check_env#check_vim_ver(800) || osv_ultis#check_env#check_nvim_ver('nvim')
    let s:spaceline_conf = {'lazy':1,
                \'on_event': ['BufNewFile', 'BufRead'],
                \'depends':['vim-signify', 'vim-devicons'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/spaceline_conf.vim'}
    if g:osv_complete_engine == 'coc'
        call add(s:spaceline_conf.depends, 'coc.nvim')
    endif
    if g:osv_linter == 'ale'
        call add(s:spaceline_conf.depends, 'ale')
    endif
    call osv_ultis#plug#add('lee-shun/spaceline.vim', s:spaceline_conf)

    " do not enable in under the ssh connetction.
    " only works if fcitx or fcitx5 is available.
    if g:os_name == 'Linux' && empty($SSH_CLIENT) && empty($SSH_TTY)
        if executable('fcitx-remote')
            call osv_ultis#plug#add('rlue/vim-barbaric', {'lazy':1,
                        \'on_event':['InsertEnter'],
                        \'hook_source':'let g:barbaric_fcitx_cmd = "fcitx-remote"',
                        \})
        elseif executable('fcitx5-remote')
            call osv_ultis#plug#add('rlue/vim-barbaric', {'lazy':1,
                        \'on_event':['InsertEnter'],
                        \'hook_source':'let g:barbaric_fcitx_cmd = "fcitx5-remote"',
                        \})
        endif
    endif
endif

" let end_t = reltime(start_t)
" echo "used: ". reltimefloat(end_t) * 1000 . "ms"
