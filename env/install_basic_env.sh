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

echo "install curl..."
sudo apt install -y curl

echo "install xclip, xsel..."
sudo apt install -y xclip xsel

echo "install python3, pip3, and pynvim..."
sudo apt install -y python3 python3-pip
sudo pip3 install pynvim
