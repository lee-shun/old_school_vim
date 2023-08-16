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

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hasklig.zip
sudo mkdir -p /usr/share/fonts/osv_font
unzip Hasklig.zip -d Hasklig/
sudo cp -r Hasklig/* /usr/share/fonts/osv_font
rm -rf Hasklig/
fc-cache -fv
