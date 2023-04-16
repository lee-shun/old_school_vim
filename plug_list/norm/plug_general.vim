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

if v:version >= 802
    let s:dein_version = 'master'
elseif v:version >= 800
    let s:dein_version = '2.2'
elseif v:version >= 704
    let s:dein_version = '1.5'
endif

call dein#add('Shougo/dein.vim', {
            \'rev': s:dein_version
            \})
call dein#add('haya14busa/dein-command.vim', {
            \'on_cmd':'Dein'
            \})

call dein#add('arcticicestudio/nord-vim', {
            \'hook_add':'source $CONF_PATH/plug_conf/color_conf.vim'
            \})

call dein#add('mhinz/vim-startify')
