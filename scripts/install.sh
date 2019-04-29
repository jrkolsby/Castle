#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone http://git.kernel.org/pub/scm/docs/man-pages/man-pages ~/.vim/bundle/man

if [[ -f ~/.vimrc ]]; then 
        echo "backup .vimrc.bak"
        mv ~/.vimrc ~/.vimrc.bak 
fi
if [[ -f ~/.bashrc ]]; then 
        echo "backup .bashrc.bak"
        mv ~/.bashrc ~/.bashrc.bak
fi
if [[ -f ~/.tmux.conf ]]; then 
        echo "backup .tmux.conf.bak"
        mv ~/.tmux.conf ~/.tmux.conf.bak 
fi
if [[ -f ~/.bash_profile ]]; then 
        echo "backup .bash_profile.bak"
        mv ~/.bash_profile ~/.bash_profile.bak 
fi

ln -sf ~/.vim/config/.vimrc ~/.vimrc
ln -sf ~/.vim/config/.tmux.conf ~/.tmux.conf
ln -sf ~/.vim/config/.bash_profile ~/.bashrc
ln -sf ~/.vim/config/.bash_profile ~/.bash_profile
ln -sf ~/.vim/scripts/git-completion.sh ~/.git-completion.sh
