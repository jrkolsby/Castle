"                                STARTVUNDLE
" ____________________________________________________________________________

function s:StartVundle()

  filetype off
  call vundle#rc()

  Plugin 'gmarik/vundle'

  " __ GITHUB _________________________________

  Plugin 'altercation/vim-colors-solarized'
  Plugin 'itchyny/lightline.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'majutsushi/tagbar'
  Plugin 'fs111/pydoc.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-fugitive'
  Plugin 'gregsexton/gitv'

  " Syntastic checker-ek:
  " c:      gcc, splint
  " python: flake8, pylint

  " __ VIM-SCRIPTS ____________________________

  Plugin 'Align',
  Plugin 'EasyGrep',
  Plugin 'NumUtils',
  Plugin 'vis'

  " __ OTHER REPOS ____________________________

  " Plugin 'git://git.wincent.com/command-t.git'

  " __ LOCAL REPOS ____________________________

  Plugin 'file://~/.vim/bundle/vegyes'

  filetype plugin indent on

endfunction

"                               INSTALLVUNDLE
" ____________________________________________________________________________
"
" Cloning vundle to ~/.vim/bundle/vundle

function s:InstallVundle()

  let vundle_repo = 'https://github.com/gmarik/vundle.git'
  let path = substitute( $HOME . '/.vim/bundle/vundle', '/', has( 'win32' ) ? '\\' : '/', 'g' )

  if system( 'git --version' ) !~ '^git'
    echohl WarningMsg | echomsg 'Git is not available.' | echohl None
    return
  endif

  let install = confirm( 'Install vundle?', "&Yes\n&No", 2, 'Qusetion' )
  if install == 2
    return
  endif

  if ! isdirectory( path )
    silent! if ! mkdir( path, 'p' )
      echohl ErrorMsg | echomsg 'Cannot create directory (may be a regular file): ' . path | echohl None
      return
    endif
  endif

  echo 'Cloning vundle...'
  if system( 'git clone "' . vundle_repo . '" "' . path . '"'  ) =~ 'fatal'
    echohl ErrorMsg | echomsg 'Cannot clone ' . vundle_repo . ' (' . path . ' may be not empty)' | echohl None
    return
  endif

  call s:StartVundle()
  PluginInstall

endfunction

"                           START / INSTALL VUNDLE
" ____________________________________________________________________________

set nocompatible
set runtimepath+=$HOME/.vim/bundle/vundle/
runtime autoload/vundle.vim

if ! exists( '*vundle#rc' )
  autocmd  VimEnter  *  call s:InstallVundle()
else
  call s:StartVundle()
endif

"                          BEGIN VIM CONFIGURATION
" ____________________________________________________________________________

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
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'

" Map tab if html file
autocmd FileType html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


call vundle#end()
filetype plugin indent on

" Maps Ctrl-n
map <C-n> :NERDTreeToggle<CR>

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

" Enable mouse!
" set mouse=a

" Enable Line Numbers
set number

" Maps Ctrl-[h,j,k,l] to resizing and navigating window split
map <silent> <C-h> <C-w><
map <silent> <C-l> <C-w>>
map <silent> <C-k> <C-w><C-w>
map <silent> <C-j> <C-w><S-w>

" Buffer switching using tab and shift tab in normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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
