#!/bin/bash

# GENERATE BACKUPS
if [[ -e ~/.vim ]]; then
        echo ".vim -> .vim.bak"
	mv ~/.vim ~/.vim.bak
fi

if [[ -e ~/.mutt ]]; then
        echo ".mutt -> .mutt.bak"
	mv ~/.mutt ~/.mutt.bak
fi
    
if [[ -f ~/.vimrc ]]; then 
        echo ".vimrc -> .vimrc.bak"
        mv ~/.vimrc ~/.vimrc.bak 
fi
if [[ -f ~/.bashrc ]]; then 
        echo ".bashrc -> .bashrc.bak"
        mv ~/.bashrc ~/.bashrc.bak
fi
if [[ -f ~/.tmux.conf ]]; then 
        echo ".tmux.conf -> .tmux.conf"
        mv ~/.tmux.conf ~/.tmux.conf.bak 
fi
if [[ -f ~/.bash_profile ]]; then 
        echo ".bash_profile -> .bash_profile.bak"
        mv ~/.bash_profile ~/.bash_profile.bak 
fi

# GENERATE HOME DIRECTORY SYMLINKS
cd && {
    ln -s ~/.castle/dir/.vim
    ln -s ~/.castle/dir/.mutt
    ln -s ~/.castle/dot/.vimrc
    ln -s ~/.castle/dot/.tmux.conf
    ln -s ~/.castle/dot/.bash_profile
    ln -s ~/.castle/dot/.bash_profile .bashrc
}

# CLONE REPOS
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone http://git.kernel.org/pub/scm/docs/man-pages/man-pages ~/man
