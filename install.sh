#!/bin/bash

# Symlink the vimrc file
ln -s init.vim .vimrc
mv .vimrc ~/

# Install Plug: will need to run PlugInstall! when loading vim for the first time
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Update apt and install some basics
sudo apt update -y
sudo apt install fzf ripgrep build-essential

# Update git config
git config --global user.email "jagtesh@gmail.com"
git config --global user.name "Jagtesh Chadha"
