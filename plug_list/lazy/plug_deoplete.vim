"*******************************************************************************
"                                                                              "
"          .oOOOo.   o      o       .oOOOo.         o                 o        "
"         .O     o. O      O        o     o        O                 O         "
"         O       o o      o        O.             o                 o         "
"         o       O O      o         `OOoo.        O                 O         "
"         O       o o  .oOoO              `O .oOo  OoOo. .oOo. .oOo. o         "
"         o       O O  o   O               o O     o   o O   o O   o O         "
"         `o     O' o  O   o        O.    .O o     o   O o   O o   O o         "
"          `OoooO'  Oo `OoO'o        `oooO'  `OoO' O   o `OoO' `OoO' Oo        "
"                                                                              "
"  Author : lee-shun                                                           "
"                                                                              "
"  Email  : 2015097272@qq.com                                                  "
"                                                                              "
"*******************************************************************************

if !has('nvim')
call dein#add('roxma/nvim-yarp', {'lazy':1})
call dein#add('roxma/vim-hug-neovim-rpc',{'lazy':1})
endif

" ===
" === deoplete plugins
" ===
if g:os_architect != 'aarch64'
    call dein#add('tbodt/deoplete-tabnine', { 'lazy':1,
                \'build': './install.sh',})
endif

if dein#is_available('vim-lsp')
    call dein#add('lighttiger2505/deoplete-vim-lsp',{'lazy':1})
endif

call dein#add('Shougo/deoplete.nvim',{'lazy':1,
            \'depends':['nvim-yarp','vim-hug-neovim-rpc','deoplete-tabnine',
            \'deoplete-vim-lsp', 'vim-snippets', 'ultisnips'],
            \'on_event': 'InsertEnter',
            \'hook_add':'let g:deoplete#enable_at_startup = 1 ',
            \'hook_post_source':'source $CONF_PATH/plug_conf/deoplete_conf.vim' })
