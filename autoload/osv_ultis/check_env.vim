" level: warn, err
fun! osv_ultis#check_env#check_executable(plugin_name, exe_to_check, level)
    let l:res = executable(a:exe_to_check)
    if l:res
        return true
    endif

    if a:level == 'warn'
        call osv_ultis#msg#warn(a:plugin_name." needs the ".a:exe_to_check ."!")
    elseif a:level == 'err'
        call osv_ultis#msg#err(a:plugin_name." needs the ".a:exe_to_check ."!")
    endif
    return false
endfun

" vim: patch-x.x.xxxx, nvim: nvim-x.x.x
fun! osv_ultis#check_env#check_version(vim_ver, nvim_ver)
    if has('nvim')
        return has(a:nvim_ver)
    else
        return has(a:vim_ver)
    endif
endfun
