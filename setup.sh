#!/bin/bash

## Create symbolic links
ln -f -s `pwd`/.bashrc $HOME/.bashrc
ln -f -s `pwd`/.bash_profile $HOME/.bash_profile
ln -f -s `pwd`/.zprofile $HOME/.zprofile
ln -f -s `pwd`/.dir_colors $HOME/.dir_colors
ln -f -s `pwd`/.gitconfig $HOME/.gitconfig
ln -f -s `pwd`/.gitignore $HOME/.gitignore
ln -f -s `pwd`/.inputrc $HOME/.inputrc
ln -f -s `pwd`/.tmux.conf $HOME/.tmux.conf
ln -f -s `pwd`/.vimrc $HOME/.vimrc

## Setup vim
source .vimsetup
