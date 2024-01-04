echo "Usage: use stable to install neovim stable build."
echo "use unstable to install neovim unstable build."

read version

if [ "$version" == "stable" ]
then
    sudo add-apt-repository ppa:neovim-ppa/stable
elif [ "$version" == "unstable" ]
then
    sudo add-apt-repository ppa:neovim-ppa/unstable
else
    echo "wrong version input!\n"
    exit
fi

sudo apt update && sudo apt install -y neovim
