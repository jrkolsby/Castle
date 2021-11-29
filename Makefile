.PHONY : install
install:
	if [ -e ~/.vim ]; then mv ~/.vim ~/.vim.bak; fi
	if [ -e ~/.mutt ]; then mv ~/.mutt ~/.mutt.bak; fi
	if [ -f ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc.bak; fi
	if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.bak; fi
	if [ -f ~/.tmux.conf ]; then mv ~/.tmux.conf ~/.tmux.conf.bak; fi
	if [ -f ~/.chunkwmrc ]; then mv ~/.chunkwmrc ~/.chunkwmrc.bak; fi
	if [ -f ~/.skhdrc ]; then mv ~/.skhdrc ~/.skhdrc.bak; fi
	if [ -f ~/.bash_profile ]; then mv ~/.bash_profile ~/.bash_profile.bak; fi
	ln -s ~/.castle/dirs/.vim ~/.vim
	ln -s ~/.castle/dirs/.mutt ~/.mutt
	ln -s ~/.castle/dotfiles/.vimrc ~/.vimrc
	ln -s ~/.castle/dotfiles/.skhdrc ~/.skhdrc
	ln -s ~/.castle/dotfiles/.chunkwmrc ~/.chunkwmrc
	ln -s ~/.castle/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/.castle/dotfiles/.bashrc ~/.bashrc
	ln -s ~/.castle/dotfiles/.bashrc ~/.bash_profile
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone http://git.kernel.org/pub/scm/docs/man-pages/man-pages ~/man
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.castle/dirs/tmux-resurrect

.PHONY : uninstall
uninstall: 
	rm ~/.mutt
	rm ~/.vimrc
	rm ~/.bashrc
	rm ~/.skhdrc
	rm -rf ~/man
	rm -rf ~/.vim
	rm ~/.chunkwmrc
	rm ~/.tmux.conf
	rm ~/.bash_profile
	if [ -e ~/.vim.bak ]; then mv ~/.vim.bak ~/.vim; fi
	if [ -e ~/.mutt.bak ]; then mv ~/.mutt.bak ~/.mutt; fi
	if [ -f ~/.vimrc.bak ]; then mv ~/.vimrc.bak ~/.vimrc; fi
	if [ -f ~/.bashrc.bak ]; then mv ~/.bashrc.bak ~/.bashrc; fi
	if [ -f ~/.tmux.conf.bak ]; then mv ~/.tmux.conf.bak ~/.tmux.conf; fi
	if [ -f ~/.chunkwmrc.bak ]; then mv ~/.chunkwmrc.bak ~/.chunkwmrc; fi
	if [ -f ~/.skhdrc.bak ]; then mv ~/.skhdrc.bak ~/.skhdrc; fi
	if [ -f ~/.bash_profile.bak ]; then mv ~/.bash_profile.bak ~/.bash_profile; fi
