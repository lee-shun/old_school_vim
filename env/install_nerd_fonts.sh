#!/bin/bash


# ------------------------------------------------------------------------------
#
#   Copyright (C) 2022 Concordia NAVlab. All rights reserved.
#
#   @Filename: install_nerd_fonts.sh
#
#   @Author: Shun Li
#
#   @Date: 2022-09-01
#
#   @Email: 2015097272@qq.com
#
#   @Description: 
#
# ------------------------------------------------------------------------------


sudo mkdir -p /usr/share/fonts/pure_vim_font
sudo cp -r ~/.vim/env/*.otf /usr/share/fonts/pure_vim_font
fc-cache -fv
