if g:osv_snip == 'none'
    finish
endif

" snippest  source
if g:osv_snip == 'ultisnips' || g:osv_snip == 'coc'
    call dein#add('honza/vim-snippets', {'lazy':1,
                \'on_event':'InsertEnter',
                \})
endif
if g:osv_snip == 'coc' || g:osv_snip == 'vsnip'
    call dein#add('rafamadriz/friendly-snippets',{'lazy':1,
                \'on_event':'InsertEnter',
                \})
endif

if g:osv_snip == 'ultisnips'
    call dein#add('SirVer/ultisnips', {'lazy':1,
                \'depends':['vim-snippets'],
                \'on_event':'InsertEnter',
                \'hook_source':'source $CONF_PATH/plug_conf/before/snippets_conf.vim'
                \})
elseif g:osv_snip == 'vsnip'
    call dein#add('hrsh7th/vim-vsnip-integ',{'lazy':1,
                \})
    let s:vsnip_conf = {'lazy':1,
                \'depends':['vim-vsnip-integ', 'friendly-snippets'],
                \'on_event':'InsertEnter',
                \'hook_post_source':'source $CONF_PATH/plug_conf/after/vsnip_conf.vim',
                \}
    call dein#add('hrsh7th/vim-vsnip',s:vsnip_conf)
endif
