#!/bin/bash

## Create symbolic links
ln -s .bashrc $HOME/.bashrc
ln -s .dir_colors $HOME/.dir_colors
ln -s .gitconfig $HOME/.gitconfig
ln -s .gitignore $HOME/.gitignore
ln -s .inputrc $HOME/.inputrc
ln -s .tmux.conf $HOME/.tmux.conf
ln -s .vimrc $HOME/.vimrc

## Setup vim
source .vimsetup
