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

if has('nvim') || (!has('nvim')&&v:version>=900)
    call dein#add('github/copilot.vim', {'lazy':1,
                \'on_event':'BufReadPost',
                \'hook_done_update':'Copilot setup',
                \'hook_add':'source $CONF_PATH/plug_conf/copilot_conf.vim'
                \})
endif

if executable('ccls') || executable('clangd')
    call dein#add('jackguo380/vim-lsp-cxx-highlight', {'lazy':1,
                \'on_ft':['cpp', 'c'],
                \'hook_post_source':'source $CONF_PATH/plug_conf/vim_lsp_cxx_hl_conf.vim'})
endif

if g:old_school_vim_plug_coc == 0
    call dein#add( 'voldikss/vim-translator', {'lazy':1,
                \    'on_cmd':'TranslateW',
                \'hook_add':'source $CONF_PATH/plug_conf/translate_conf.vim'
                \})
endif

if has('python3')
    call dein#add( 'honza/vim-snippets', {'lazy':1,
                \ 'on_event':'InsertEnter'
                \})
    if g:old_school_vim_plug_coc == 0
        call dein#add( 'SirVer/ultisnips', {'lazy':1,
                    \ 'depends':['vim-snippets'],
                    \ 'on_event':'InsertEnter',
                    \'hook_add':'source $CONF_PATH/plug_conf/snippets_conf.vim'
                    \})
    endif
endif

call dein#add('sbdchd/neoformat', {'lazy':1,
            \'on_cmd':'Neoformat'})

call dein#add('preservim/vim-markdown', {'lazy':1,
            \'on_ft' :['markdown'],
            \})

if (g:os_name == 'Linux' && g:os_architect == 'x86_64') || (g:os_name == 'Windows')
    " only Linux_x86_64, Windows have this plugin
    call dein#add('iamcco/markdown-preview.nvim', {'lazy':1,
                \'on_ft' :['markdown'],
                \'hook_done_update':'call mkdp#util#install_sync()',
                \'hook_add':'source $CONF_PATH/plug_conf/mkd_preview_conf.vim'
                \})
endif

call dein#add( 'ferrine/md-img-paste.vim',{'lazy':1,
            \'on_ft':'markdown',
            \'hook_add':'source $CONF_PATH/plug_conf/mkd_paste_img_conf.vim'
            \})

let g:vim_tex_conf = {'lazy':1,
            \'depends':[],
            \'on_ft':['tex', 'plaintex'],
            \'hook_post_source':'source $CONF_PATH/plug_conf/vimtex_conf.vim'
            \}
if g:old_school_vim_plug_deoplete == 1
    call add(g:vim_tex_conf.depends, 'deoplete.nvim')
endif
call dein#add('lervag/vimtex', g:vim_tex_conf)

if (g:os_name == 'Linux') && (executable('roscore'))
    call dein#add( 'taketwo/vim-ros', {'lazy':1,
                \ 'on_ft':'rosmsg',
                \ 'on_cmd':'Roscd'
                \})
endif

call dein#add( 'edersonferreira/open.vim', {'lazy':1,
            \'on_event':'BufReadPost',
            \'hook_add':'source $CONF_PATH/plug_conf/open_conf.vim',
            \})
