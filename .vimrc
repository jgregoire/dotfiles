colorscheme base16-railscasts

set nocompatible

if has('filetype')
    filetype indent plugin on
endif

if has('syntax')
    syntax on
endif

if has('mouse')
    set mouse=a
endif

set wildmenu        " Better command-line completion.
set showcmd         " Show partial list of commands in last line of the screen.
set cmdheight=2

set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings

set number	    " Show line numbers
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch       " Highlight matching brace
set visualbell      " Use visual bell (no beeping)

"set nostartofline  " Stop certain movements from always going to the first character of a line.

set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " Searches for strings incrementally

set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab

set ruler           " Show row and column ruler information
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

set scrolloff=4     " The number of screen lines to keep above and below the cursor.
set cursorline      " Highlight the line currently under cursor.
set title           " Set the window’s title, reflecting the file currently being edited.

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set confirm         " Raise a dialogue asking if you wish to save changed files.
"set visualbell      " Visual bell only, no audible.
"set t_vb=          " No visual bell, either.

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search.
nnoremap <C-L> :nohl<CR><C-L> 

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default.
map Y y$

" jk acts like ESC
inoremap jk <ESC>
