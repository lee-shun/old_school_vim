function! osv_ultis#msg#info(message) abort
    highlight OsvInfo guifg=green guibg=gray
    echohl OsvInfo
    echomsg "OSV info: ".a:message | echo ""
    echohl None
    return 0
endfunction

function! osv_ultis#msg#warn(message) abort
    if !exists('g:osv_debug') || g:osv_debug == 0
        return 0
    endif
    highlight OsvWarn guifg=yellow guibg=gray
    echohl OsvWarn
    echomsg "OSV warn: ".a:message | echo ""
    echohl None
    return 0
endfunction

function! osv_ultis#msg#err(message) abort
    highlight OsvErr guifg=red guibg=gray
    echohl OsvErr
    echomsg "OSV error: ".a:message | echo ""
    echohl None
    return 0
endfunction
