#!/bin/bash


# ------------------------------------------------------------------------------
#
#   Copyright (C) 2022 Concordia NAVlab. All rights reserved.
#
#   @Filename: install_nerd_fonts_mirror.sh
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

sudo rm -rf /usr/share/fonts/osv_font
git clone https://gitee.com/old_school_vim/nerd_fonts --depth 1

cd nerd_fonts/
rm -rf .git/
unzip Hasklig.zip -d osv_font/
unzip MapleMono-SC-NF.zip -d osv_font/
sudo mv osv_font /usr/share/fonts/
cd ..

sudo fc-cache -fv
