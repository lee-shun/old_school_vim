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

if g:osv_complete_engine != 'coc'
    if g:osv_file_explorer == 'defx'
        call dein#add('kristijanhusak/defx-git', {'lazy':1,
                    \'hook_source':'source $CONF_PATH/plug_conf/before/defx_git_config.vim'})
        call dein#add('kristijanhusak/defx-icons', {'lazy':1,
                    \'depends':['vim-devicons'],
                    \'hook_source':'source $CONF_PATH/plug_conf/before/defx_icons_conf.vim'})
        let s:defx_nvim_config = {'lazy':1,
                    \'on_cmd':'Defx',
                    \'on_map':'<leader>t',
                    \'depends':['nvim-yarp', 'vim-hug-neovim-rpc', 'defx-git', 'defx-icons'],
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/defx_conf.vim',
                    \'hook_done_update': ''}
        if has('nvim')
            let s:defx_nvim_config.hook_done_update = 'UpdateRemotePlugins'
        endif
        call dein#add('Shougo/defx.nvim', s:defx_nvim_config)
    elseif g:osv_file_explorer == 'fern'
        call dein#add('lambdalisue/nerdfont.vim', {'lazy':1,
                    \})
        call dein#add('lambdalisue/fern-renderer-nerdfont.vim', {'lazy':1,
                    \'depends':['nerdfont.vim'],
                    \})
        call dein#add('lambdalisue/fern-hijack.vim', {'lazy':1,
                    \})
        call dein#add('lambdalisue/fern-git-status.vim', {'lazy':1,
                    \})
        call dein#add('lambdalisue/fern.vim', {'lazy':1,
                    \'on_map':'<leader>t',
                    \'on_cmd':'Fern',
                    \'depends':['fern-renderer-nerdfont.vim', 'fern-hijack.vim', 'fern-git-status.vim'],
                    \'hook_source':'source $CONF_PATH/plug_conf/before/fern_conf.vim',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/fern_conf.vim'})
    elseif g:osv_file_explorer == 'vimfiler'
        call dein#add('Shougo/unite.vim', {'lazy':1,
                    \})
        call dein#add('Shougo/vimfiler.vim', {'lazy':1,
                    \'on_map':'<leader>t',
                    \'on_cmd':'VimFiler',
                    \'depends':['unite.vim', 'vim-devicons'],
                    \'hook_source':'source $CONF_PATH/plug_conf/before/vimfiler_conf.vim',
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/vimfiler_conf.vim'})
    endif
endif

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
            \'on_event': ['BufReadPost'],
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
            \'on_event': ['BufReadPost']
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

if g:os_name == 'Linux'
    call dein#add('junegunn/fzf', {'lazy':1,
                \'build': './install --all',
                \})
elseif g:os_name == 'Windows'
    call dein#add('junegunn/fzf', {'lazy':1,
                \'build': 'powershell.exe .\install.ps1',
                \})
endif
call dein#add('junegunn/fzf.vim', {'lazy':1,
            \'depends': ['fzf'],
            \'on_map':{'n':'<leader>f'},
            \'on_cmd' : [ 'FZF', 'Files', 'GFiles', 'Buffers', 'Colors', 'Ag', 'Rg', 'Lines', 'BLines', 'Tags', 'BTags', 'Marks', 'Windows', 'Locate', 'History', 'Snippets', 'Commits', 'BCommits', 'Commands', 'Maps', 'Helptags', 'Filetypes' ],
            \'hook_source':'source $CONF_PATH/plug_conf/before/fzf_conf.vim',
            \'hook_post_source' : 'source $CONF_PATH/plug_conf/after/fzf_conf.vim'
            \})

call dein#add('tibabit/vim-templates', {'lazy':1,
            \'on_cmd' : ['TemplateInit', 'TemplateExpand', 'Tmpl'],
            \'on_map':{'n':'<leader>ft'},
            \'depends':['fzf.vim'],
            \'hook_source' : 'source $CONF_PATH/plug_conf/before/templates_conf.vim',
            \'hook_post_source' : 'source $CONF_PATH/plug_conf/after/templates_conf.vim',
            \})

call dein#add('brooth/far.vim', {
            \'lazy':1,
            \'on_cmd':['F', 'Far', 'Farr',  'Farf', 'Fardo', 'Refar', 'Farundo'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/far_conf.vim'
            \})
