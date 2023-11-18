#!/bin/bash


# ------------------------------------------------------------------------------
#
#   Copyright (C) 2022 Concordia NAVlab. All rights reserved.
#
#   @Filename: install_basic_env.sh
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

sudo apt update

echo "install curl wget unzip..."
sudo apt install -y curl wget unzip

echo "install xclip, xsel..."
sudo apt install -y xclip xsel

echo "install python3, pip3, and pynvim..."
sudo apt install -y python3 python3-pip
sudo pip3 install pynvim
