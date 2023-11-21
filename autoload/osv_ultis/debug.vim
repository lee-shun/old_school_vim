function! osv_ultis#debug#get_syn()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'),col('.')), 'synIDattr(v:val, "name")')
endfunction

function! osv_ultis#debug#get_syn_group()
    let l:s = synID(line('.'),col('.'),1)
    echo synIDattr(l:s, "name").'->'.synIDattr(synIDtrans(l:s), 'name')
endfunction
