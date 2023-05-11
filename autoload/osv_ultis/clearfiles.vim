fun! osv_ultis#clearfiles#tab2space()
    exec "set expandtab"
    exec "%retab!"
endfun

fun! osv_ultis#clearfiles#space2tab()
    exec "set noexpandtab"
    exec "%retab!"
endfun

fun! osv_ultis#clearfiles#clean_extra_spaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
