syntax on                   " Syntax highlighting
set background=dark         " changs the colours to fit with a dark background
filetype plugin indent on   " enable file type indenting && language dependent indenting

"Tabs
set tabstop=4 softtabstop=4 " 
set shiftwidth=4            "   
set expandtab               " 
set smartindent             " 

"Numbers
set number                  " 
set relativenumber          " 
set ruler                   " 

"search
set nohlsearch              " Stop hl when search stops
set incsearch		        " Highlight as you search
set ignorecase		        " Do case insensitive matching
set smartcase		        " Do smart case matching

"history
set noswapfile              "
set nobackup                "
set undodir=~/.vim/undo     "
set undofile                "

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

"misc
set exrc                    " Loads directory specific .vimrc files
set noerrorbells            " Silence
"set colorcolumn=100         " Adds a colour marker on the # column
set signcolumn=yes          " 
set scrolloff=6             " Keeps the cursor away from the top/bottom of the page
set showmatch		        " Show matching brackets.
set showcmd		            " Show (partial) command in status line.
set mouse=a		            " Enable mouse usage (all modes)
"set hidden		            " Hide buffers when they are abandoned

if &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif
