
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

" style(9)
set noexpandtab
set ts=8
set sts=4
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlightning & Colors

" Use screen terminal emulation
set term=screen

" Syntax highlightning on
syntax on

hi SpecialKey     cterm=bold        ctermfg=NONE
hi NonText        cterm=bold        ctermfg=NONE
hi Directory      cterm=bold        ctermfg=NONE
hi ErrorMsg       cterm=standout    ctermfg=NONE
hi IncSearch      cterm=reverse     ctermfg=NONE
hi Search         cterm=reverse     ctermfg=NONE
hi MoreMsg        cterm=bold        ctermfg=NONE
hi ModeMsg        cterm=bold        ctermfg=NONE
hi LineNr	  cterm=bold	    ctermfg=White
hi Question       cterm=standout    ctermfg=NONE
hi StatusLine     cterm=bold,reverse    ctermfg=NONE
hi StatusLineNC   cterm=reverse     ctermfg=NONE
hi VertSplit      cterm=reverse     ctermfg=NONE
hi Title          cterm=bold        ctermfg=NONE
hi Visual         cterm=reverse     ctermfg=NONE
hi VisualNOS      cterm=bold,underline  ctermfg=NONE
hi WarningMsg     cterm=standout    ctermfg=NONE
hi WildMenu       cterm=standout    ctermfg=NONE
hi Folded         cterm=standout    ctermfg=NONE
hi FoldColumn     cterm=standout    ctermfg=NONE
hi DiffAdd        cterm=bold        ctermfg=NONE
hi DiffChange     cterm=bold        ctermfg=NONE
hi DiffDelete     cterm=bold        ctermfg=NONE
hi DiffText       cterm=reverse     ctermfg=NONE
hi Comment        cterm=bold        ctermfg=NONE
hi Constant       cterm=underline   ctermfg=NONE
hi Special        cterm=bold        ctermfg=NONE
hi Identifier     cterm=underline   ctermfg=NONE
hi Statement      cterm=bold        ctermfg=NONE
hi PreProc        cterm=underline   ctermfg=NONE
hi Type           cterm=underline   ctermfg=NONE
hi Underlined     cterm=underline   ctermfg=NONE
hi Ignore         cterm=bold        ctermfg=NONE
hi Error          cterm=reverse     ctermfg=NONE
hi Todo           cterm=standout    ctermfg=NONE


" Highlight extra whitespace in end of line
hi ExtraWhitespace ctermbg=White
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLEave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

