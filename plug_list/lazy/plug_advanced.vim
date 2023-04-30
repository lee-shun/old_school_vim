call dein#add('tibabit/vim-templates', {'lazy':1,
            \'on_cmd':['TemplateAutoInit', 'TemplateInit', 'TemplateExpand'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/templates_conf.vim',
            \})

call dein#add('liuchengxu/vista.vim', {'lazy':1,
            \'on_cmd':['Vista'],
            \})

" NOTE: coc has its sematic token, and only ccls supprots this plugin
if executable('ccls')
    call dein#add('jackguo380/vim-lsp-cxx-highlight', {'lazy':1,
                \'on_ft':['cpp', 'c'],
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/vim_lsp_cxx_hl_conf.vim'
                \})
endif

if g:osv_complete_engine != 'coc'
    call dein#add('voldikss/vim-translator', {'lazy':1,
                \'on_map':{'n':'<leader>s', 'v':'<leader>s'},
                \'on_cmd':'TranslateW',
                \'hook_source':'source $CONF_PATH/plug_conf/before/translate_conf.vim'
                \})
endif

call dein#add('honza/vim-snippets', {'lazy':1,
            \'on_event':'InsertEnter'
            \})

if g:osv_complete_engine != 'coc'
    if (has('nvim') || v:version >= 800) && has('python3')
        call dein#add('SirVer/ultisnips', {'lazy':1,
                    \'depends':['vim-snippets'],
                    \'on_event':'InsertEnter',
                    \'hook_source':'source $CONF_PATH/plug_conf/before/snippets_conf.vim'
                    \})
    endif
endif

call dein#add('sbdchd/neoformat', {'lazy':1,
            \'on_cmd':'Neoformat'
            \})

call dein#add('preservim/vim-markdown', {'lazy':1,
            \'on_ft' :['markdown'],
            \})

if (g:os_name == 'Linux' && g:os_architect == 'x86_64') || (g:os_name == 'Windows')
    " only Linux_x86_64, Windows have this plugin
    call dein#add('iamcco/markdown-preview.nvim', {'lazy':1,
                \'on_ft' :['markdown'],
                \'hook_done_update':'call mkdp#util#install_sync()',
                \'hook_source':'source $CONF_PATH/plug_conf/before/mkd_preview_conf.vim'
                \})
endif

call dein#add('ferrine/md-img-paste.vim',{'lazy':1,
            \'on_ft':'markdown',
            \'hook_source':'source $CONF_PATH/plug_conf/before/mkd_paste_img_conf.vim'
            \})

call dein#add('lervag/vimtex', {'lazy':1,
            \'on_ft':['tex'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vimtex_conf.vim',
            \})

if (g:os_name == 'Linux') && (executable('roscore'))
    call dein#add('taketwo/vim-ros', {'lazy':1,
                \'on_ft':'rosmsg',
                \'on_cmd':'Roscd'
                \})
endif

call dein#add('edersonferreira/open.vim', {'lazy':1,
            \'on_event':'BufReadPost',
            \'hook_source':'source $CONF_PATH/plug_conf/before/open_conf.vim',
            \})
