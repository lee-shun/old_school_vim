#!/bin/bash


# ------------------------------------------------------------------------------
#
#   Copyright (C) 2022 Concordia NAVlab. All rights reserved.
#
#   @Filename: config_env.sh
#
#   @Author: Shun Li
#
#   @Date: 2022-08-27
#
#   @Email: 2015097272@qq.com
#
#   @Description: 
#
# ------------------------------------------------------------------------------

echo "this simple bash will config the basic environment for pure vim!"
sudo apt update

echo "install curl..."
sudo apt install curl

echo "install xclip..."
sudo apt install xclip

echo "install python3, pip3, and pynvim..."
sudo apt install python3 python3-pip
sudo pip3 install pynvim

echo "install nerd font for the system..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -fv
