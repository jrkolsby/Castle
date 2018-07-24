#/usr/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim

ln -s ./config/vimrc ../.vimrc
ln -s ./config/bashrc ../.bash_profile
ln -s ./config/tmux.conf ../.tmux.conf
