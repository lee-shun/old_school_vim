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

echo " this script will config the dependencies for pure_vim..."

# basic
while true
do
    read -r -p "install pure_vim basic dependencies? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            sudo apt update
            ./env/install_basic_env.sh
            break
            ;;
        [nN][oO]|[nN])
            break
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done

# font
while true
do
    read -r -p "install nerd fonts to /usr/share/fonts/pure_vim_font/? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            ./env/install_nerd_fonts.sh
            break
            ;;
        [nN][oO]|[nN])
            break
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done

# cpp
echo "config the C++ language sever..."
while true
do
    read -r -p "install ccls by snap? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            ./env/install_cpp_lsp.sh
            break
            ;;
        [nN][oO]|[nN])
            break
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done

echo "config the python language sever..."
while true
do
    read -r -p "install pyright by pip3? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            ./env/install_python_lsp.sh
            break
            ;;
        [nN][oO]|[nN])
            break
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done

echo  "All Done! Enjoy!"
