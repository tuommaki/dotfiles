
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/vimproc'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kana/vim-filetype-haskell'
Bundle 'ujihisa/neco-ghc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'klen/python-mode'


" The actual Vim settings
filetype plugin indent on

set cul
set history=100
set mouse=a
set ttymouse=xterm
set termencoding=utf-8
set laststatus=2
set encoding=utf-8

colorscheme solarized
set background=dark

let g:Powerline_symbols = 'fancy'

" Use enhanced command-line completion mode
set wildmenu
" When more than one match, list all matches and complete till longest common string
set wildmode=list:longest
" Ignore these file extensions
set wildignore=*.o,*.obj,*.class,*.pyc,*.jpg,*.png,*.gif,*.pdf
" Set backup directory
set backupdir=~/.vim/backups
" Set swap file directory
set directory=~/.vim/swap

set showmode
set showcmd
set nowrap
set ignorecase
set smartcase
set number
set shiftwidth=2
set ts=2
set expandtab

set hidden
" Copy indent from current line when starting a new line
set autoindent
" Do smart autoindenting when starting a new line.
set smartindent

set backspace=indent,eol,start
set printoptions=paper:a4,syntax:n


" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

set foldmethod=indent
set foldlevel=0
set foldnestmax=2

let mapleader=","

" Remember marks for the last 20 files, contents of registers (up to 50 lines), registers with more than 100 KB text are
" skipped, restore hlsearch and save them to ~/.viminfo
set viminfo='20,<50,s100,h,n~/.viminfo

" Trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLEave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

map <F8> :NERDTreeToggle<CR>
map <Leader>f <Esc>:1,$!xmllint --format -<CR>
map <Leader>j <Esc>:%!json_xs -f json -t json-pretty<CR>

set tags=./tags,./TAGS,tags,TAGS

" Disable tab expansion in HTML/Template files
au FileType html set noexpandtab
au FileType htmldjango set noexpandtab

au FileType haskell setlocal omnifunc=necoghc#omnifunc

"
"" Tip 80
"
" When we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 autocmd!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END



if has("autocmd")
   " Reload vimrc after editing
   autocmd BufWritePost ~/.vimrc source ~/.vimrc
endif


