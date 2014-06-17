
" Use screen terminal emulation
set term=screen

" Syntax highlightning on
syntax on

" Highlight extra whitespace in end of line
hi ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLEave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Configure line numbers
hi LineNr	term=bold	ctermfg=White
set numberwidth=4
set number

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


" Minimum number of screen lines to keep above and below the cursor
set scrolloff=5

set foldmethod=indent
set foldlevel=0
set foldnestmax=2

let mapleader=","

" Remember marks for the last 20 files, contents of registers (up to 50 lines), registers
" skipped, restore hlsearch and save them to ~/.viminfo
set viminfo='20,<50,s100,h,n~/.viminfo
