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

call dein#add('neoclide/coc.nvim', { 'lazy':'1',
            \'depends':['vim-snippets'],
            \'merged': 0,
            \'rev': 'release',
            \'hook_post_source':'source $CONF_PATH/plug_conf/coc_conf.vim'})

call dein#add('josa42/vim-lightline-coc', {'lazy':1,
            \'depends':['lightline.vim', 'coc.nvim'],
            \'on_event': ['BufReadPre'], 
            \'hook_add':'source $CONF_PATH/plug_conf/lightline_coc_conf.vim',
            \'hook_post_source':'call lightline#coc#register() | call lightline#init()'})
