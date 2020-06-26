#!/bin/bash
###########


echo "Install fish 3.x repository"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

echo "Change default shell to fish"
chsh -s `which fish`

echo "Check if version 3.x is installed"
fish -v



echo "Install Vim"
sudo apt install vim
echo "Installing Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "...done"
echo "Installing VIM-Plugins with Vundle"
vim +PluginInstall +qall
echo "...done"




echo "Install i3wm and shit"
sudo apt install i3 i3status rofi
