" ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: See bottom of the config for Vundle plugins

set cul
set history=100
set termencoding=utf-8
set encoding=utf-8
set showmode
set showcmd
set nowrap
set ignorecase
set smartcase
set autoindent
set smartindent
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*.class,*.pyc
set backspace=indent,eol,start
set printoptions=paper:a4,syntax:n

syntax on

set expandtab
set ts=4
set sts=2
set sw=4

" Configure line numbers
set numberwidth=4
set number

" Minimum number of screen lines to keep above and below the cursor
set scrolloff=5

set foldmethod=indent
set foldlevel=0
set foldnestmax=2

let mapleader=","

" Remember marks for the last 20 files, contents of registers (up to 50 lines), registers
" skipped, restore hlsearch and save them to ~/.viminfo
set viminfo='20,<50,s100,h,n~/.viminfo


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'nowk/genericdc'
Plugin 'brookhong/cscope.vim'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of Vundle Section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F8> :NERDTreeToggle<CR>
map <Leader>f <Esc>:1,$!xmllint --format -<CR>
map <Leader>j <Esc>:%!python -m json.tool<CR>

" Highlight extra whitespace in end of line
hi ExtraWhitespace ctermbg=White
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLEave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"colorscheme desert
colorscheme strange

let g:airline_powerline_fonts = 1
