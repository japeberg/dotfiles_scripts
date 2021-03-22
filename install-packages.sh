#!/bin/bash
###########

echo "Install git, curl, wget"
sudo apt install git curl wget

echo "Install fish 3.x repository"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

echo "Change default shell to fish"
chsh -s `which fish`

echo "Check if version 3.x is installed"
fish -v

echo "Clone dotfile Repository"
git clone --bare git@github.com:japeberg/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
mkdir -p ~/.config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} ~/.config-backup/{}
fi;
config checkout

config config status.showUntrackedFiles no
echo "Install Vim"
sudo apt install vim
echo "Installing Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "...done"
echo "Installing VIM-Plugins with Vundle"
vim +PluginInstall +qall
echo "...done"
