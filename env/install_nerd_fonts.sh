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

# 获取当前脚本的绝对路径
this_script=$(readlink -f "$0")
# 获取当前脚本的目录
script_dir=$(dirname "$this_script")
nerd_fonts_dir=$script_dir/nerd_fonts

sudo rm -rf /usr/share/fonts/osv_font
mkdir -p $nerd_fonts_dir

cd $nerd_fonts_dir
if [ -f "Hasklig.zip" ];then
    echo "Hasklig.zip is already downloaded!"
else
    echo "dowload the Hasklig.zip"
    curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
        | grep "browser_download_url.*Hasklig.zip" \
        | cut -d : -f 2,3 \
        | tr -d \"\
        | wget -qi -
fi

if [ -f "MapleMono-SC-NF.zip" ];then
    echo "MapleMono-SC-NF.zip is already downloaded!"
else
    echo "dowload the MapleMono-SC-NF.zip"
    curl -s https://api.github.com/repos/subframe7536/maple-font/releases/latest \
        | grep "browser_download_url.*SC-NF.zip" \
        | cut -d : -f 2,3 \
        | tr -d \"\
        | wget -qi -
fi
unzip Hasklig.zip -d osv_font/
unzip MapleMono-SC-NF.zip -d osv_font/
sudo mv osv_font /usr/share/fonts/

sudo fc-cache -fv
