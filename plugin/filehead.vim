"***********************************************************************************************************************
"       ___       ___           ___           ___                    ___           ___                       ___
"      /\__\     /\  \         /\  \         /\  \                  /\__\         /\__\          ___        /\__\
"     /:/  /    /::\  \       /::\  \       /::\  \                /::|  |       /:/  /         /\  \      /::|  |
"    /:/  /    /:/\:\  \     /:/\:\  \     /:/\ \  \              /:|:|  |      /:/  /          \:\  \    /:|:|  |
"   /:/  /    /::\~\:\  \   /::\~\:\  \   _\:\~\ \  \            /:/|:|  |__   /:/__/  ___      /::\__\  /:/|:|__|__
"  /:/__/    /:/\:\ \:\__\ /:/\:\ \:\__\ /\ \:\ \ \__\          /:/ |:| /\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\
"  \:\  \    \:\~\:\ \/__/ \:\~\:\ \/__/ \:\ \:\ \/__/          \/__|:|/:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /
"   \:\  \    \:\ \:\__\    \:\ \:\__\    \:\ \:\__\                |:/:/  /   |:|__/:/  /  \::/__/           /:/  /
"    \:\  \    \:\ \/__/     \:\ \/__/     \:\/:/  /                |::/  /     \::::/__/    \:\__\          /:/  /
"     \:\__\    \:\__\        \:\__\        \::/  /                 /:/  /       ~~~~         \/__/         /:/  /
"      \/__/     \/__/         \/__/         \/__/                  \/__/                                   \/__/
"
"Author : Shun Li
"
"Email  : 2015097272@qq.com
"
"***********************************************************************************************************************

" ===
" === automaticallly add file head
" ===
autocmd BufNewFile *.cxx,*.c,*.cc,*.hpp,*.h,*.cpp,Makefile,CMakeLists.txt,*.sh,*.zsh,*.py exec ":call SetTitle()"

func SetComment()
    call setline(1,"/*******************************************************************************")
    call append(line(".")    , "*")
    call append(line(".")+1  , "*   Copyright (C) ".strftime("%Y")." Concordia NAVlab. All rights reserved.")
    call append(line(".")+2  , "*")
    call append(line(".")+3  , "*   @Filename: ".expand("%:t"))
    call append(line(".")+4  , "*")
    call append(line(".")+5  , "*   @Author: Shun Li")
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

" for shell-like file
func SetComment_sh()
    call setline(3, "#------------------------------------------------------------------------------")
    call setline(4 , "#")
    call setline(5  , "#   Copyright (C) ".strftime("%Y")." Concordia NAVlab. All rights reserved.")
    call setline(6  , "#")
    call setline(7  , "#   @Filename: ".expand("%:t"))
    call setline(8  , "#")
    call setline(9  , "#   @Author: Shun Li")
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
        call setline(1,"#!/usr/bin/env python3")
        call setline(2,"# -*- coding: utf-8 -*- #")
        call SetComment_sh()
    else
        call SetComment()
        if expand("%:e") == 'hpp'
            call append(line(".")+15, "#ifndef __".toupper(expand("%:t:r"))."_HPP__")
            call append(line(".")+16, "#define __".toupper(expand("%:t:r"))."_HPP__")
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
