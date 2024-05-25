function! osv_ultis#msg#info(message) abort
    echohl OsvInfo
    echomsg "OSV info: ".a:message | echo ""
    echohl None
    return 0
endfunction

function! osv_ultis#msg#warn(message) abort
    if !exists('g:osv_debug') || g:osv_debug == 0
        return 0
    endif
    echohl OsvWarn
    echomsg "OSV warn: ".a:message | echo ""
    echohl None
    return 0
endfunction

function! osv_ultis#msg#err(message) abort
    echohl OsvErr
    echomsg "OSV error: ".a:message | echo ""
    echohl None
    return 0
endfunction
