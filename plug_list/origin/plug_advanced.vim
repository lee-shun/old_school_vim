call dein#add('tibabit/vim-templates', {'lazy':1,
            \'on_cmd':['TemplateAutoInit', 'TemplateInit', 'TemplateExpand'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/templates_conf.vim',
            \})

call dein#add('liuchengxu/vista.vim', {'lazy':1,
            \'on_cmd':['Vista'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/vista.vim',
            \})

" NOTE: coc has its sematic token, and only ccls supprots this plugin
if g:osv_complete_engine == 'coc' || g:osv_lsp == 'vim-lsp'
    if executable('ccls')
        call dein#add('jackguo380/vim-lsp-cxx-highlight', {'lazy':1,
                    \'on_ft':['cpp', 'c'],
                    \'hook_post_source':'source $CONF_PATH/plug_conf/after/vim_lsp_cxx_hl_conf.vim'
                    \})
    else
        call osv_ultis#msg#warn("vim-lsp-cxx-hl needs the ccls installed! Skip!")
    endif
endif

call dein#add('chxuan/cpp-mode', {'lazy':1,
            \'on_ft':['cpp'],
            \})

call dein#add('ilyachur/cmake4vim', {'lazy':1,
            \ 'on_cmd':['CMake', 'CMakeBuild', 'CMakeClean', 'CMakeInfo',
            \ 'CMakeRun', 'CMakeSelectTarget', 'CMakeReset', 'CMakeSelectBuildType'],
            \'hook_source':'source $CONF_PATH/plug_conf/before/cmake_conf.vim',
            \})

if g:osv_complete_engine != 'coc'
    call dein#add('voldikss/vim-translator', {'lazy':1,
                \'on_map':{'n':'<leader>s', 'v':'<leader>s'},
                \'on_cmd':'TranslateW',
                \'hook_source':'source $CONF_PATH/plug_conf/before/translate_conf.vim'
                \})
endif

call dein#add('sbdchd/neoformat', {'lazy':1,
            \'on_cmd':'Neoformat',
            \'hook_add':'command! Format Neoformat'
            \})

call dein#add('preservim/vim-markdown', {'lazy':1,
            \'on_ft' :['markdown'],
            \})

if (g:os_name == 'Linux' && g:os_architect == 'x86_64') || (g:os_name == 'Windows')
    if osv_ultis#check_env#check_vim_ver(801) || osv_ultis#check_env#check_nvim_ver('nvim')
        call dein#add('iamcco/markdown-preview.nvim', {'lazy':1,
                    \'on_ft' :['markdown'],
                    \'hook_done_update':'call mkdp#util#install_sync()',
                    \'hook_source':'source $CONF_PATH/plug_conf/before/mkd_preview_conf.vim'
                    \})
    else
        call osv_ultis#msg#warn("Mkd preview needs vim >=8.1 or nvim! Skip!")
    endif
else
    call osv_ultis#msg#warn("Only Linux_x86_64, Windows have mkd preview! Skip!")
endif

call dein#add('ferrine/md-img-paste.vim',{'lazy':1,
            \'on_ft':'markdown',
            \'hook_source':'source $CONF_PATH/plug_conf/before/mkd_paste_img_conf.vim'
            \})

if executable('latexmk')
    call dein#add('lervag/vimtex', {'lazy':1,
                \'on_ft':['tex'],
                \'hook_source':'source $CONF_PATH/plug_conf/before/vimtex_conf.vim',
                \})
else
    call osv_ultis#msg#warn('Vimtex needs the texlive to be installed! Skip!')
endif

if (g:os_name == 'Linux') && (executable('roscore'))
    call dein#add('taketwo/vim-ros', {'lazy':1,
                \'on_ft':'rosmsg',
                \'on_cmd':'Roscd'
                \})
else
    call osv_ultis#msg#warn('Vim-ros needs the ros to be installed! Skip!')
endif

call dein#add('edersonferreira/open.vim', {'lazy':1,
            \'on_event':'BufReadPost',
            \'hook_source':'source $CONF_PATH/plug_conf/before/open_conf.vim',
            \})

call dein#add('kkoomen/vim-doge', {'lazy':1,
            \'on_cmd':'DogeGenerate',
            \'hook_done_update':'call doge#install()',
            \'hook_source':'source $CONF_PATH/plug_conf/before/doge_conf.vim'
            \})
