" c++
if executable('ccls')
    call dein#add('jackguo380/vim-lsp-cxx-highlight', {'lazy':1,
                \'on_ft':['cpp', 'c']})
endif

call dein#add('dense-analysis/ale', {'lazy':1,
            \'on_event':'BufReadPre',
            \'hook_add':'source $CONF_PATH/plug_conf/ale_conf.vim'})

call dein#add('prabirshrestha/vim-lsp',{'lazy':1,
            \'on_event':'BufReadPost',
            \'hook_post_source':'source $CONF_PATH/plug_conf/vim_lsp_conf.vim'})

call dein#add('rhysd/vim-lsp-ale', {'lazy':1,
            \'depends':['ale', 'vim-lsp'],
            \'on_event':'BufReadPost'})

call dein#add('maximbaz/lightline-ale', {'lazy':1,
            \'depends':['lightline.vim', 'vim-lsp', 'ale'],
            \'on_event':'BufReadPost',})

