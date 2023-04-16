" ===
" === 编译运行
" ===
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -ggdb -o %<.out"
        exec "!echo '--------------------------------------------'"
        exec "!time ./%<.out"
    elseif &filetype == 'cpp'
        exec "!g++ -std=c++11 -ggdb % -Wall -o %<.out"
        exec "!echo '--------------------------------------------'"
        exec "!time ./%<.out"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'vimwiki'
        exec "MarkdownPreview"
    elseif &filetype == 'pandoc'
        exec "MarkdownPreview"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

