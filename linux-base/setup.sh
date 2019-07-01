#!/bin/bash

# make sure to edit the path to what is appropriate for your VM
. ~/.sandbox.conf.sh

echo "Provisioning!"

echo "apt-get updating"
sudo apt-get update
echo "install curl if not there..."
sudo apt-get -y install curl
echo "installing git if not there..."
sudo apt-get -y install git

echo "Installing dd-agent from api_key: ${DD_API_KEY}..."
DD_API_KEY=${DD_API_KEY} DD_INSTALL_ONLY=true DD_HOSTNAME=${HOSTNAME_BASE}.agent6-beta bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

echo "copying .bashrc settings"
cp ~/data/bashrc.txt ~/.bashrc

echo "copying vim settings from personal repo"
git clone --recurse-submodules https://github.com/NoisomePossum/Vim-settings.git
ln -s ~/vim-settings/.vimrc ~/.vimrc
ln -s ~/vim-settings/.vim ~/.vim

echo "installing Vim 8"
sudo apt-get install -y ncurses-dev
git clone https://github.com/vim/vim.git
cd vim/src
make

cd ~

echo "installing Neovim"
sudo curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
sudo chmod 755 nvim.appimage

sudo service datadog-agent start
