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

sudo rm -rf /usr/share/fonts/osv_font
mkdir -p nerd_fonts

cd nerd_fonts
if [ -f "Hasklig.zip" ];then
    echo "Hasklig.zip is already downloaded!"
else
    echo "dowload the Hasklig.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hasklig.zip
fi

if [ -f "MapleMono-SC-NF.zip" ];then
    echo "MapleMono-SC-NF.zip is already downloaded!"
else
    echo "dowload the MapleMono-SC-NF.zip"
    wget https://github.com/subframe7536/maple-font/releases/download/v6.4/MapleMono-SC-NF.zip
fi
unzip Hasklig.zip -d osv_font/
unzip MapleMono-SC-NF.zip -d osv_font/
sudo mv osv_font /usr/share/fonts/
cd ..

sudo fc-cache -fv
