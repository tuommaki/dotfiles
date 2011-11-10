set nocompatible

syntax on
filetype on
filetype indent on
filetype plugin on


if has("gui_running")
    let &guicursor = &guicursor . ",a:blinkon0"
    set guioptions-=e
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions+=a
    set guioptions+=c
"    colorscheme oceandeep 
"    colorscheme wombat
"    colorscheme zenburn
    colorscheme solarized
    set background=dark
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 7 antialias
else
"    colorscheme desert
"    colorscheme zenburn
    set background=dark
    colorscheme solarized
    set mouse=a
    set ttymouse=xterm
    set termencoding=utf-8
endif


set cul
set history=100

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
set shiftwidth=3
set ts=3
set expandtab

set hidden

" Copy indent from current line when starting a new line
set autoindent
" Do smart autoindenting when starting a new line.
set smartindent


set visualbell
set laststatus=2
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ \ %-25(%3l,%c%03V\ \ %P\ (%L)%)%12o'%03b'

set backspace=indent,eol,start

set printoptions=paper:a4,syntax:n


" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

set foldmethod=indent
set foldlevel=0
set foldnestmax=2


" Remember marks for the last 20 files, contents of registers (up to 50 lines), registers with more than 100 KB text are
" skipped, restore hlsearch and save them to ~/.viminfo
set viminfo='20,<50,s100,h,n~/.viminfo

" Trailing whitespaces
syntax match Error "\s\+$"
syntax match Error "\t"

set makeprg=ghc\ %<.hs
set errorformat=
                    \%-Z\ %#,
                    \%W%f:%l:%c:\ Warning:\ %m,
                    \%E%f:%l:%c:\ %m,
                    \%E%>%f:%l:%c:,
                    \%+C\ \ %#%m,
                    \%W%>%f:%l:%c:,
                    \%+C\ \ %#%tarning:\ %m,


let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_allow_hash_operator=1

let g:haskell_indent_if   = 2
let g:haskell_indent_case = 4


map F :let &fen = !&fen<CR>

map <F8> :NERDTreeToggle<CR>
map ,f <Esc>:1,$!xmllint --format -<CR>
map ,j <Esc>:%!json_xs -f json -t json-pretty<CR>

"set tags=./tags,./TAGS,tags,TAGS,~/Work/Repositories/EyeOne/trunk/Source/server/tags,/usr/lib/jvm/java-6-sun/src/tags
"set tags=./tags,./TAGS,tags,TAGS,/usr/lib/jvm/java-6-sun/src/tags,/home/tuommaki/Sources/httpcomponents-core-4.0/tags
set tags=./tags,./TAGS,tags,TAGS

" ,/ C/C++/C#/Java // comments
au FileType c map ,c :s/^/\/\/ /<CR>
au FileType c map ,C :s.^// .. <CR> :noh <CR>
au FileType java map ,c :s/^/\/\/ /<CR>
au FileType java map ,C :s.^// .. <CR> :noh <CR>

au FileType python map <F6> :!igor %<CR> <bar> :e!<CR>

" Disable tab expansion in HTML/Template files
au FileType html set noexpandtab
au FileType htmldjango set noexpandtab

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

