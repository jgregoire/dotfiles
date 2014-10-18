" Syntax highlighting
syntax on

" Apparently this prevents fuckery by some distros?
set nocompatible

" Intelligent file type identification
filetype indent plugin on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Better searching
set hlsearch
set incsearch

" Case insensitve search, except when using capital letters
set ignorecase
set smartcase

" Tabbing
set ai   " Auto-indent
set si   " Smart indent
set smarttab
set shiftwidth=4
set tabstop=4

" Long lines
map j gj
map k gk
set wrap

" Always show the status line
set laststatus=2

" Confirm instead of fail for unsaved changes
set confirm

" Enable mouse for all modes
set mouse=a

" Display line numbers
set number

" If file is changed externally, automatically update in editor
set autoread

" Set backspace to act sanely
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight matching brackets
set showmatch
" And how many tenths of a second do we blink them?
set mat=2


