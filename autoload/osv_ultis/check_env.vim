" for example: patch-x.x.xxxx
fun! osv_ultis#check_env#check_vim_patch(vim_patch)
    if has('nvim')
        return 0
    else
        return has(a:vim_patch)
    endif
endfun

" for example: 801
fun! osv_ultis#check_env#check_vim_ver(vim_ver)
    if has('nvim')
        return 0
    endif
    return v:version >= a:vim_ver
endfun

" for example: nvim-0.4.1
fun! osv_ultis#check_env#check_nvim_ver(nvim_ver)
    if !has('nvim')
        return 0
    endif
    return has(nvim_ver)
endfun
