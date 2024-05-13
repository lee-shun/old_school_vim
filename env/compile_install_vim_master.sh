#!/usr/bin/env sh

######################################################################
# @author      : ShunLi (2015097272@qq.com)
# @file        : compile_install_vim_master
# @created     : 星期一 5月 13, 2024 10:03:12 CST
#
# @description :
######################################################################

# Display operation information and ask for confirmation
echo "This script will perform the following actions:"
echo "1. Clone the master branch source code of Vim"
echo "2. Install required dependencies"
echo "3. Compile and install Vim to /usr/local"
read -p "Do you wish to proceed? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "Operation cancelled."
    exit 1
fi

CUR_DIR=$(pwd)
vim_source=$CUR_DIR/vim_master

# Update system package lists (if applicable)
sudo apt-get update

# Install dependencies required for compilation
sudo apt-get install -y build-essential libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev \
libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libluajit-5.1-dev \
libperl-dev git

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git not found. Please install git first."
    exit 1
fi

# Download Vim source code
echo "Cloning Vim source code..."
git clone https://github.com/vim/vim.git --depth=1 $vim_source

# Enter the source code directory
cd $vim_source

# Update to the master branch (if not the default after cloning)
git checkout master

# Configure and compile Vim
echo "Configuring and compiling Vim..."
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=auto \
            --enable-cscope \
            --prefix=/usr/local

# Check if configuration was successful
if [ $? -ne 0 ]; then
    echo "Configuration failed. Please check the error messages."
    exit 1
fi

# Compile and install
make -j $(( $(nproc) - 1 ))
sudo make install -j $(( $(nproc) - 1 ))

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "Vim has been successfully installed to /usr/local/bin/vim"
else
    echo "An error occurred during installation. Please check the error messages."
fi

cd $CUR_DIR

/usr/local/bin/vim --version

echo "All operations completed."
