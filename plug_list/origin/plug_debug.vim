if osv_ultis#check_env#check_vim_patch('patch-8.0.1453') || osv_ultis#check_env#check_nvim_ver('nvim-0.3.1')
    call dein#add('dstein64/vim-startuptime', {'lazy':1,
                \'on_cmd':['StartupTime'],
                \})
endif
