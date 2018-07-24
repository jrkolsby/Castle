#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.vim/config/.vimrc ~/.vimrc
ln -s ~/.vim/config/.tmux.conf ~/.tmux.conf
ln -s ~/.vim/config/.bash_profile ~/.bash_profile
ln -s ~/.vim/scripts/git-completion.sh ~/.git-completion.sh
