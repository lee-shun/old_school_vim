if has('patch-8.0.1453') || has('nvim-0.3.1')
    call dein#add('dstein64/vim-startuptime', {'lazy':1,
                \'on_cmd':['StartupTime'],
                \})
endif
