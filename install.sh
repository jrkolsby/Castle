#/usr/bin/bash

mv ~/.vim ~/.vim_old && mv ~/.vimrc ~/.vimrc_old
mv ~/.vim/.bashrc ~/.bash_profile

echo "runtime vimrc" > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

