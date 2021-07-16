syntax on
set background=dark
filetype plugin indent on

"Tabs
set tabstop=4 softtabstop=4 " 
set shiftwidth=4            "   
set expandtab               " 
set smartindent             " 

"Numbers
set number                  " 
set relativenumber          " 

"search
set nohlsearch              " Stop hl when search stops
set incsearch		        " Highlight as you search
set ignorecase		        " Do case insensitive matching
set smartcase		        " Do smart case matching

"misc
set exrc                    " Loads directory specific .vimrc files
set noerrorbells            " Silence
set colorcolumn=80          " 
set signcolumn=yes          " 
set scrolloff=6             " Keeps the cursor away from the top/bottom of the page
set showmatch		        " Show matching brackets.
set showcmd		            " Show (partial) command in status line.
set mouse=a		            " Enable mouse usage (all modes)
"set hidden		            " Hide buffers when they are abandoned

highlight ColorColumn ctermbg=0 guibg=lightgrey

"history
set noswapfile              " 
"set nobackup                " 
"set undodir=~/.vim/undo     " 
"set undofile                " 

if &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif
