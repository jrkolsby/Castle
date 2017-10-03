# 1. Install Vim Config

### Bash Command
To preserve previous Vim install:
```
mv ~/.vim ~/.vim_old && mv ~/.vimrc ~/.vimrc_old
```
Install
```
git clone https://github.com/jrkolsby/Vim.git ~/.vim && echo "runtime vimrc" > ~/.vimrc
```

### Breakdown
```
mv ~/.vim ~/.vim_old
mv ~/.vimrc ~/.vimrc_old
git clone https://github.com/jrkolsby/Vim.git ~/.vim
echo "runtime vimrc" > ~/.vimrc
```

# 2. Install Plugins (Optional):

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim
:PluginInstall
```

## Plugins
1. Vundle
2. NerdTree
3. Emmet 
4. Handlebars Syntax

# 3. Intall Bash config (Optional)
```
mv ~/.vim/.bashrc ~/.bashrc
# IF on a MacOS machine:
mv .bashrc .bash_profile
```

# 4. Color Pallette (Mandatory)
[ ] Make Color Pallette
[ ] Figure out how to spell palette

