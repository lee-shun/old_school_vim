" auto-update the timestamp right before saving a file
" Last [Cc]hange(d)
" Changed
" Last [Mm]odified
" Modified
" Last [Uu]pdate(d)
" https://gist.github.com/jelera/7838011

function! TimeStamp()
    let pat = '\(\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\).*'
    let rep = '\1' . strftime("%a %d %b %Y %I:%M:%S %p")
    call s:subst(1, line('$'), pat, rep)
endfunction

function! s:subst(start, end, pat, rep)
    let lineno = a:start
    while lineno <= a:end
    let curline = getline(lineno)
    if match(curline, a:pat) != -1
        let newline = substitute( curline, a:pat, a:rep, '' )
        if( newline != curline )
        keepjumps call setline(lineno, newline)
        endif
    endif
    let lineno = lineno + 1
    endwhile
endfunction
