if exists("g:loaded_vimrc") || &cp
  finish
else
  let g:loaded_vimrc = 1
end

" Vundle Configuration

" Required things
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()
call vundle#begin()

" Vundle manages Vundle
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jparise/vim-graphql'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'

" Map tab if html file
autocmd FileType html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


call vundle#end()
filetype plugin indent on

" Maps Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Show hidden files except for swp
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.swp$']

" silent SCP editing
let g:netrw_silent=1

" Open NERDTree automatically on directory open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml" 

" Turn off autocomment
au FileType * set fo-=r fo-=o

" increase undo size
set history=1000

" colors!
colorscheme noctu

" i don't really know what this does
filetype plugin indent on

" highlighting
syntax enable

" pad scrolling
set scrolloff=8

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" easy navigation between wrapped lines
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Split Panes Lookin Nice
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=NONE
set splitbelow
set splitright

" Make it quick
set ttyfast

" Backspace fix for macvim
set backspace=indent,eol,start

" Mac clipboard
set clipboard=unnamedplus,unnamed

" Enable Line Numbers
set number

" Maps Ctrl-[h,j,k,l] to resizing and navigating window split
map <silent> <C-h> <C-w><
map <silent> <C-l> <C-w>>
map <silent> <C-o> <C-w>+
map <silent> <C-p> <C-w>-
map <silent> <C-k> <C-w><C-w>
map <silent> <C-j> <C-w><S-w>

" Buffer switching using tab and shift tab in normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" LINE 
" LENGTH 
" SORTING
xnoremap s : ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>
xnoremap S : ! awk '{ print length(), $0 \| "sort -rn \| cut -d\\  -f2-" }'<CR>

" and don't let MacVim remap them
if has("gui_macvim")
    let macvim_skip_cmd_opt_movement = 1
endif

" Always replace tab with spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

autocmd FileType make setlocal noexpandtab
autocmd FileType makefile setlocal noexpandtab
" Text file settings
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=80 " spell spelllang=en_us

" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Prepend ~/.backup to backupdir so that Vim will look for that directory 
" before littering the current dir with backups.
set backupdir^=~/.backup

" Also use ~/.backup for swap files. The trailing // tells Vim to incorporate
" full path into swap file names.
set dir^=~/.backup//

" Ignore case when searching
" - override this setting by tacking on \c or \C to your search term to make
"   your search always case-insensitive or case-sensitive, respectively.
set ignorecase
