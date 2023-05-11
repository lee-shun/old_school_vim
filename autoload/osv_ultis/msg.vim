function! osv_ultis#msg#info(message) abort
    echomsg a:message | echo ""
    return 0
endfunction

function! osv_ultis#msg#warn(message) abort
    if !exists('g:osv_warning') || g:osv_warning == 0
        return 0
    endif
    echohl WarningMsg
    echomsg a:message | echo ""
    echohl None
    return 0
endfunction

function! osv_ultis#msg#err(message) abort
    echohl ErrorMsg
    echomsg a:message | echo ""
    echohl None
    return 0
endfunction
