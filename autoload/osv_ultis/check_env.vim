" patch-x.x.xxxx, nvim-x.x.x
fun! osv_ultis#check_env#check_version(vim_ver, nvim_ver)
    if has('nvim')
        if a:nvim_ver == 'none'
            return 0
        endif
        return has(a:nvim_ver)
    else
        " nvim only
        if a:vim_ver == 'none'
            return 1
        endif
        return has(a:vim_ver)
    endif
endfun
