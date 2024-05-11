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

# 获取当前脚本的绝对路径
this_script=$(readlink -f "$0")
# 获取当前脚本的目录
script_dir=$(dirname "$this_script")

nerd_fonts_dir=$script_dir/nerd_fonts

sudo rm -rf /usr/share/fonts/osv_font
git clone  --depth 1 https://gitee.com/old_school_vim/nerd_fonts $nerd_fonts_dir

cd $nerd_fonts_dir
rm -rf .git/
unzip Hasklig.zip -d osv_font/
unzip MapleMono-SC-NF.zip -d osv_font/
sudo mv osv_font /usr/share/fonts/

sudo fc-cache -fv

exit 0;
