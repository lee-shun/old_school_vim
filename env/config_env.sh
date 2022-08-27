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


echo "Install curl..."

sudo apt update
sudo apt install curl

echo "Install python3, pip3, and pynvim..."

sudo apt install python3 python3-pip
sudo pip3 install pynvim
