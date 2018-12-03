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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'jparise/vim-graphql'
Plugin 'mattn/emmet-vim'
Plugin 'commentary.vim'
Plugin 'w0rp/ale'

" Map tab if html file
autocmd FileType html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
autocmd FileType php imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
autocmd Filetype ml setlocal shiftwidth=2

call vundle#end()

" Maps Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Show hidden files except for swp
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.swo$']

" silent SCP editing
let g:netrw_silent=1

" Open NERDTree automatically on directory open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Fuzzy find
set rtp+=/usr/local/opt/fzf

" Filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml" 

" Turn off autocomment
au FileType * set fo-=r fo-=o

" increase undo size
set history=1000

" colors!
colorscheme noctu

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Backspace fix for macvim
set backspace=indent,eol,start

" Mac clipboard
set clipboard=unnamedplus,unnamed

" Don't copy when pasting
vnoremap p "_dP

" Enable Line Numbers
set number

" Maps Ctrl-[h,j,k,l] to resizing and navigating window split
map <silent> <C-h> <C-w><
map <silent> <C-l> <C-w>>
map <silent> <C-k> <C-w><C-w>
map <silent> <C-j> <C-w><S-w>

map <silent> <C-t> <C-w>+
map <silent> <C-y> <C-w>-
map <silent> <C-o> <C-w><
map <silent> <C-p> <C-w>>

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

" Plugin-specific indentation
filetype plugin indent on
set expandtab
set smarttab
set autoindent

autocmd FileType make setlocal noexpandtab
autocmd FileType makefile setlocal noexpandtab
" Text file settings
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=80 " spell spelllang=en_us

" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell
autocmd Filetype ocaml setlocal ts=2 sw=2 expandtab
autocmd Filetype ml setlocal ts=2 sw=2 expandtab

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

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
