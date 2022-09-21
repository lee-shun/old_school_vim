call dein#add('Shougo/dein.vim')

call dein#add('sainnhe/everforest', {
            \'hook_add':"source $CONF_PATH/plug_conf/color_conf.vim"
            \})

call dein#add('ryanoasis/vim-devicons')

call dein#add('mhinz/vim-startify')

call dein#add('junegunn/fzf', {
            \'build': './install --all',
            \})
call dein#add('yuki-yano/fzf-preview.vim', {
            \'rev': 'release/rpc',
            \'hook_add' : 'source $CONF_PATH/plug_conf/fzf_conf.vim'})
