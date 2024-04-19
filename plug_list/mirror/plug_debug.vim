if osv_ultis#check_env#check_version('patch-8.0.1453', 'nvim-0.3.1')
    call dein#add('old_school_vim/vim-startuptime', {'lazy':1,
                \'on_cmd':['StartupTime'],
                \})
endif
