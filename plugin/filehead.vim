" Not load for ulti-mode.
if g:osv_ulti_mode == 1
  finish
endif

" ===
" === automaticallly add file head
" ===

func SetComment()
    call setline(1,"/*******************************************************************************")
    call setline(2  , "*")
    call setline(2  , "*   Copyright (C) ".strftime("%Y")." Concordia NAVlab. All rights reserved.")
    call setline(3  , "*")
    call setline(4  , "*   @Filename: ".expand("%:t"))
    call setline(5  , "*")
    call setline(6  , "*   @Author: Shun Li")
    call setline(7  , "*")
    call setline(8  , "*   @Email: 2015097272@qq.com")
    call setline(9  , "*")
    call setline(10  , "*   @Date: ".strftime("%Y-%m-%d"))
    call setline(11  , "*")
    call setline(12  , "*   @Description: ")
    call setline(13  , "*")
    call setline(14 , "*******************************************************************************/")
    call setline(15 , "")
    call setline(16 , "")
endfunc

" for shell-like file
func SetCommentSh()
    call setline(3,"")
    call setline(4, "# ------------------------------------------------------------------------------")
    call setline(5 , "#")
    call setline(6  , "#   Copyright (C) ".strftime("%Y")." Concordia NAVlab. All rights reserved.")
    call setline(7  , "#")
    call setline(8  , "#   @Filename: ".expand("%:t"))
    call setline(9  , "#")
    call setline(10  , "#   @Author: Shun Li")
    call setline(11  , "#")
    call setline(12 , "#   @Date: ".strftime("%Y-%m-%d"))
    call setline(13  , "#")
    call setline(14 , "#   @Email: 2015097272@qq.com")
    call setline(15 , "#")
    call setline(16 , "#   @Description: ")
    call setline(17 , "#")
    call setline(18, "# ------------------------------------------------------------------------------")
    call setline(19, "")
    call setline(20, "")
endfunc

func SetTitle()
    if expand("%:e") == 'make'
        call setline(1,"")
        call setline(2,"")
        call SetCommentSh()

    elseif expand("%:e") == 'txt'
        call setline(1,"")
        call setline(2,"")
        call SetCommentSh()

    elseif expand("%:e") == 'sh'
        call setline(1,"#!/bin/bash")
        call setline(2,"")
        call SetCommentSh()

    elseif expand("%:e") == 'zsh'
        call setline(1,"#!/bin/zsh")
        call setline(2,"")
        call SetCommentSh()

    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python3")
        call setline(2,"# -*- coding: utf-8 -*- #")
        call SetCommentSh()

    elseif expand("%:e") == 'hpp'
        call SetComment()
        call setline(17, "#ifndef ".toupper(substitute(expand("%:p:r"), "\/", "_", "g"))."_HPP_")
        call setline(18, "#define ".toupper(substitute(expand("%:p:r"), "\/", "_", "g"))."_HPP_")
        call setline(19, "")
        call setline(20, "")
        call setline(21, "#include<iostream>")
        call setline(22, "")
        call setline(23, "namespace A{")
        call setline(24, "namespace B{")
        call setline(25, "class ".expand("%:t:r")."{};")
        call setline(26, "}")
        call setline(27, "}")
        call setline(28, "")
        call setline(29, "")
        call setline(30, "#endif // ".toupper(substitute(expand("%:p:r"), "\/", "_", "g"))."_HPP_")

    elseif expand("%:e") == 'h'
        call SetComment()
        call setline(17, "#pragma once")

    elseif expand("%:e") == 'c'
        call SetComment()
        call setline(17,"#include \"".expand("%:t:r").".h\"")
        call setline(18, "int main(int argc, char** argv){")
        call setline(19, "return 0;")
        call setline(20, "}")

    elseif expand("%:e") == 'cpp'
        call SetComment()
        call setline(17,"#include \"".expand("%:t:r").".hpp\"")
        call setline(18, "int main(int argc, char** argv) {")
        call setline(19, "return 0;")
        call setline(20, "}")

    elseif expand("%:e") == 'cc'
        call SetComment()
        call setline(17,"#include \"".expand("%:t:r").".hpp\"")
        call setline(18, "int main(int argc, char** argv){")
        call setline(19, "return 0;")
        call setline(20, "}")

    elseif expand("%:e") == 'cxx'
        call SetComment()
        call setline(17,"#include \"".expand("%:t:r").".hpp\"")
        call setline(18, "int main(int argc, char** argv){")
        call setline(19, "return 0;")
        call setline(20, "}")
    endif
endfunc


autocmd BufNewFile *.cxx,*.c,*.cc,*.hpp,*.h,*.cpp,Makefile,CMakeLists.txt,*.sh,*.zsh,*.py exec ":call SetTitle()"
