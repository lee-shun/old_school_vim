function! osv_ultis#system#exec(cmd) abort
    if g:os_name == 'Windows'
        return system('powershell.exe '.a:cmd)
    else
        return system(a:cmd)
    endif
endfunction

