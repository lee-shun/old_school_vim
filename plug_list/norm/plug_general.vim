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

call dein#add('Shougo/dein.vim')

call dein#add('sainnhe/sonokai', {
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
