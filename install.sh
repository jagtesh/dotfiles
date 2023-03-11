#!/bin/bash

# Symlink the vimrc file
ln -s init.vim .vimrc
mkdir -p ~/.config/nvim
cp .vimrc ~/.config/nvim/init.vim
mv .vimrc ~/

# Install Plug: will need to run PlugInstall! when loading vim for the first time
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.config/nvim ~/.vim

# Install tpm for tmux
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# Update apt and install some basics
sudo apt update -y
sudo apt install -y fzf ripgrep build-essential

# Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
