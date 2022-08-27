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

echo "install xclip"
sudo apt install xclip

echo "install python3, pip3, and pynvim..."
sudo apt install python3 python3-pip
sudo pip3 install pynvim
