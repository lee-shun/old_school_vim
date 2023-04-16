call dein#add('haya14busa/dein-command.vim', {
            \'on_cmd':'Dein'
            \})

call dein#add('tpope/vim-fugitive', {'lazy':1})

call dein#add('mhinz/vim-signify', {'lazy':1,
            \'on_event': ['BufReadPost'], })

let s:spaceline_conf = {'lazy':1,
            \'on_event':['BufReadPost'],
            \'depends':['vim-signify', 'vim-devicons'],
            \'hook_add':'source $CONF_PATH/plug_conf/spaceline_conf.vim'}
if g:old_school_vim_plug_coc == 1
    call add(s:spaceline_conf.depends, 'coc.nvim')
endif
if g:old_school_vim_plug_lsp == 1
    call add(s:spaceline_conf.depends, 'vim-lsp-ale')
endif
call dein#add('lee-shun/spaceline.vim', s:spaceline_conf)

call dein#add('luochen1990/rainbow', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_add':'source $CONF_PATH/plug_conf/rainbow_conf.vim'})

call dein#add('Yggdroot/indentLine', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_add':'source $CONF_PATH/plug_conf/indentLine_conf.vim'})

call dein#add('bronson/vim-trailing-whitespace', {'lazy':1,
            \'on_event':['BufReadPre'],
            \'hook_add':'let g:extra_whitespace_ignored_filetypes = ["coc-explorer", "defx", "fern"]'
            \})

call dein#add('RRethy/vim-illuminate', {'lazy':1,
            \'on_event' : ['BufReadPost'] })

call dein#add('voldikss/vim-floaterm', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'hook_add':'source $CONF_PATH/plug_conf/floaterm_conf.vim'})

if g:old_school_vim_plug_coc == 0 " coc-expolorer > defx > fern > nerdtree

    if  has('nvim-0.4') || v:version > 802 " according to the repo
        call dein#add('kristijanhusak/defx-git', {'lazy':1,
                    \'hook_add':'source $CONF_PATH/plug_conf/defx_git_config.vim'})
        call dein#add('kristijanhusak/defx-icons', {'lazy':1,
                    \'depends':'vim-devicons',
                    \'hook_add':'source $CONF_PATH/plug_conf/defx_icons_conf.vim'})
        let s:defx_nvim_config = {'lazy':1,
                    \'on_cmd':'Defx',
                    \'on_map':'<leader>t',
                    \'depends':['nvim-yarp', 'vim-hug-neovim-rpc', 'defx-git', 'defx-icons'],
                    \'hook_post_source':'source $CONF_PATH/plug_conf/defx_conf.vim',
                    \'hook_done_update': ''}
        if has('nvim')
            let s:defx_nvim_config.hook_done_update = 'UpdateRemotePlugins'
        endif
        call dein#add('Shougo/defx.nvim', s:defx_nvim_config)

    elseif has('nvim') || has('patch-8.1-2269')
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
                    \'hook_post_source':'source $CONF_PATH/plug_conf/fern_conf.vim'})
    else
        call dein#add('Shougo/unite.vim', {'lazy':1,
                    \})
        call dein#add('Shougo/vimfiler.vim', {'lazy':1,
                    \'on_map':'<leader>t',
                    \'on_cmd':'VimFiler',
                    \'depends':['unite.vim', 'vim-devicons'],
                    \'hook_add':'source $CONF_PATH/plug_conf/vimfiler.vim'})
    endif
endif

call dein#add('chrisbra/Colorizer', {'lazy':1,
            \'on_event':['BufReadPost'],
            \'on_cmd':['ColorToggle'], })

call dein#add('rlue/vim-barbaric', {'lazy':1,
            \'on_event':['InsertEnter'],
            \})

call dein#add('sakshamgupta05/vim-todo-highlight', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_add': 'source $CONF_PATH/plug_conf/todo_hl_conf.vim' })

call dein#add('junegunn/vim-peekaboo', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'on_map': {'i':'<C-r>', 'n':'"'}})

call dein#add('airblade/vim-rooter', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'hook_add':'source $CONF_PATH/plug_conf/rooter_conf.vim'
            \})

call dein#add('tpope/vim-surround', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \})

call dein#add('tpope/vim-repeat', {'lazy':1,
            \'on_map':'.',
            \})

call dein#add('tpope/vim-commentary', {'lazy':1,
            \'on_map':{'n':'gcc', 'v':'gc'},
            \})

if !has('nvim') && v:version< 802
    call dein#add('jiangmiao/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_add':'let g:AutoPairsMapSpace=0'
                \})
else " this new auto-pair need neovim or vim 8.2
    call dein#add('LunarWatcher/auto-pairs', {'lazy':1,
                \'on_event':['BufReadPost'],
                \'hook_add':'let g:AutoPairsMapSpace=0'
                \})
endif

call dein#add('machakann/vim-highlightedyank', {'lazy':1,
            \'on_event': ['TextYankPost'],
            \'hook_post_source':'source $CONF_PATH/plug_conf/hlightedyank_conf.vim'})

call dein#add('tpope/vim-speeddating', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'on_map': {'n':'<C-a>'}})

call dein#add('junegunn/vim-easy-align', {'lazy':1,
            \'on_event': ['BufReadPost'],
            \'on_map': '<Plug>(EasyAlign)',
            \'hook_add': 'source $CONF_PATH/plug_conf/easy_align_conf.vim'})

call dein#add('preservim/vim-pencil', {'lazy':1,
            \'on_cmd':['Pencil', 'NoPencil', 'PencilOff', 'TogglePencil',
            \'PencilToggle', 'SoftPencil', 'PencilSoft', 'HardPencil', 'PencilHard'],
            \'hook_post_source': 'source $CONF_PATH/plug_conf/pencil_conf.vim'})

call dein#add('mg979/vim-visual-multi', {'lazy':1,
            \'on_map': {'n':'<C-n>', 'v':'<C-n>'},
            \'hook_add':'source $CONF_PATH/plug_conf/visual_multi_conf.vim'})

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

if !has('nvim')
    call dein#add('skywind3000/asyncrun.vim', {'lazy':1,
                \'on_event': ['BufReadPost']})
    call dein#add('skywind3000/asynctasks.vim', {'lazy':1,
                \'depedns':['asyncrun.vim'],
                \'on_event': ['BufReadPost'],})
endif

call dein#add('rhysd/conflict-marker.vim', {'lazy':1,
            \'on_event': ['BufReadPost'], })

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
            \'on_cmd' : ['FZF', 'Tags', 'Buffers', 'Files', 'History', 'Lines', 'Ag', 'Rg', 'BLines'],
            \'hook_add' : 'source $CONF_PATH/plug_conf/fzf_conf.vim'})

call dein#add('tibabit/vim-templates', {'lazy':1,
            \'on_cmd' : ['TemplateInit', 'TemplateExpand'],
            \'hook_add' : 'source $CONF_PATH/plug_conf/templates_conf.vim',
            \})
