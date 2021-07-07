"**************************************************************************************************
"
"       ___          ___          ___          ___                  ___                   ___
"      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
"     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
"    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
"   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
"  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
"  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
"       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
"        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
"                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
"                   \/__/        \|__|        \/__/                                      \/__/
"
"
"  Author : lee-shun
"
"  Email  : 2015097272@qq.com
"
"**************************************************************************************************


"****************************************有用函数**************************************************

"===
"=== 转换tab为空格
"===
fun! Tab2Sapce()
    exec "set tabstop=4"
    exec "set expandtab"
    exec "%retab!"
endfun
 
"===
"=== 空格替换为TAB：
"===
fun! Sapce2Tab()
    exec "set tabstop=4"
    exec "set noexpandtab"
    exec "%retab!"
endfun

"===
"=== 清理空格
"===
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

"===
"=== 编译运行
"===
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
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

"===
"=== 选择查找
"===
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"===
"=== 自动文件
"===
autocmd BufNewFile *.cxx,*.c,*.cc,*.hpp,*.h,*.cpp,Makefile,CMakeLists.txt,*.sh,*.zsh,*.py exec ":call SetTitle()"
" 加入注释
func SetComment()
    call setline(1,"/*******************************************************************************")
    call append(line(".")    , "*")
    call append(line(".")+1  , "*   Copyright (C) ".strftime("%Y")." Lee Ltd. All rights reserved.")
    call append(line(".")+2  , "*")
    call append(line(".")+3  , "*   @Filename: ".expand("%:t"))
    call append(line(".")+4  , "*")
    call append(line(".")+5  , "*   @Author: lee-shun")
    call append(line(".")+6  , "*")
    call append(line(".")+7  , "*   @Email: 2015097272@qq.com")
    call append(line(".")+8  , "*")
    call append(line(".")+9  , "*   @Date: ".strftime("%Y-%m-%d"))
    call append(line(".")+10  , "*")
    call append(line(".")+11  , "*   @Description: ")
    call append(line(".")+12  , "*")
    call append(line(".")+13 , "******************************************************************************/")
    call append(line(".")+14 , "")
    call append(line(".")+15 , "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
    call setline(3, "#------------------------------------------------------------------------------")
    call setline(4 , "#")
    call setline(5  , "#   Copyright (C) ".strftime("%Y")." Lee Ltd. All rights reserved.")
    call setline(6  , "#")
    call setline(7  , "#   @Filename: ".expand("%:t"))
    call setline(8  , "#")
    call setline(9  , "#   @Author: lee-shun")
    call setline(10  , "#")
    call setline(11 , "#   @Date: ".strftime("%Y-%m-%d"))
    call setline(12  , "#")
    call setline(13 , "#   @Email: 2015097272@qq.com")
    call setline(14 , "#")
    call setline(15 , "#   @Description: ")
    call setline(16 , "#")
    call setline(17, "#------------------------------------------------------------------------------")
    call setline(18, "")
    call setline(19, "")
endfunc
" 定义函数SetTitle，自动插入文件头
func SetTitle()
    if expand("%:e") == 'make'
        call setline(1,"")
        call setline(2,"")
        call SetComment_sh()

    elseif expand("%:e") == 'txt'
        call setline(1,"")
        call setline(2,"")
        call SetComment_sh()

    elseif expand("%:e") == 'sh'
        call setline(1,"#!/system/bin/sh")
        call setline(2,"")
        call SetComment_sh()

    elseif expand("%:e") == 'zsh'
        call setline(1,"#!/system/bin/zsh")
        call setline(2,"")
        call SetComment_sh()

    elseif expand("%:e") == 'py'
        call setline(1,"# -*- coding: utf-8 -*- #")
        call setline(2,"")
        call SetComment_sh()
    else
        call SetComment()
        if expand("%:e") == 'hpp'
            call append(line(".")+15, "#ifndef _".toupper(expand("%:t:r"))."_HPP")
            call append(line(".")+16, "#define _".toupper(expand("%:t:r"))."_HPP")
            call append(line(".")+17, "")
            call append(line(".")+18, "")
            call append(line(".")+19, "#include<iostream>")
            call append(line(".")+20, "class ".expand("%:t:r")."{};")
            call append(line(".")+21, "")
            call append(line(".")+22, "")
            call append(line(".")+23, "")
            call append(line(".")+24, "")
            call append(line(".")+25, "#endif /* ".toupper(expand("%:t:r"))."_HPP */")
        elseif expand("%:e") == 'h'
            call append(line(".")+15, "#pragma once")
        elseif expand("%:e") == 'c'
            call append(line(".")+15,"#include \"".expand("%:t:r").".h\"")
            call append(line(".")+16, "int main(int argc, char** argv){")
            call append(line(".")+17, "return 0;")
            call append(line(".")+18, "}")
        elseif expand("%:e") == 'cpp'
            call append(line(".")+15,"#include \"".expand("%:t:r").".hpp\"")
            call append(line(".")+16, "int main(int argc, char** argv){")
            call append(line(".")+17, "return 0;")
            call append(line(".")+18, "}")
        elseif expand("%:e") == 'cc'
            call append(line(".")+15,"#include \"".expand("%:t:r").".hpp\"")
            call append(line(".")+16, "int main(int argc, char** argv){")
            call append(line(".")+17, "return 0;")
            call append(line(".")+18, "}")
        elseif expand("%:e") == 'cxx'
            call append(line(".")+15,"#include \"".expand("%:t:r").".hpp\"")
            call append(line(".")+16, "int main(int argc, char** argv){")
            call append(line(".")+17, "return 0;")
            call append(line(".")+18, "}")
        endif
    endif
endfunc
