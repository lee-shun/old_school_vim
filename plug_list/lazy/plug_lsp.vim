" c++
if executable('ccls')
    call dein#add('jackguo380/vim-lsp-cxx-highlight', {'lazy':1,
                \'on_ft':['cpp', 'c']})
endif

call dein#add('dense-analysis/ale', {'lazy':1,
            \'on_event':'BufReadPre'})

call dein#add('prabirshrestha/vim-lsp',{'lazy':1,
            \ 'on_event':'BufReadPre'})

call dein#add('rhysd/vim-lsp-ale', {'lazy':1,
            \ 'depends':['ale', 'vim-lsp'],
            \'on_event':'BufReadPre'})

call dein#add('maximbaz/lightline-ale', {'lazy':1,
            \'depends':['lightline.vim', 'vim-lsp', 'ale'],
            \'on_event':'BufReadPre',})

