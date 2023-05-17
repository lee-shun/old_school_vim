function! osv_ultis#system#exec(cmd_list) abort
    if type(a:cmd_list) == 1
        let l:final_cmd = a:cmd_list
    elseif type(a:cmd_list) == 3
        let l:final_cmd = a:cmd_list[0]
        let l:seperator = ' && '
        if g:os_name == 'Windows'
            let l:seperator = ' ; '
        endif
        " join
        for i in range(1, len(a:cmd_list)-1)
            let l:final_cmd = l:final_cmd . l:seperator . a:cmd_list[i]
        endfor
    else
        echoerr "Wrong input type!"
        return ''
    endif
    if g:os_name == 'Windows'
        return system('powershell.exe '.l:final_cmd)
    else
        return system(l:final_cmd)
    endif
endfunction

