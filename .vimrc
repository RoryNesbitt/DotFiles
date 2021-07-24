syntax on                       " Syntax highlighting
set background=dark             " changs the colours to fit with a dark background
filetype plugin indent on       " enable file type indenting && language dependent indenting

"Tabs
set tabstop=4 softtabstop=4     " 
set shiftwidth=4                " 
set expandtab                   " 
set smartindent                 " 

"Numbers
set number                      " 
set relativenumber              " 
set ruler                       " 

"Search
set nohlsearch                  " Stop hl when search stops
set incsearch		            " Highlight as you search
set ignorecase		            " Do case insensitive matching
set smartcase		            " Do smart case matching

"History
set noswapfile                  "
set nobackup                    "
set undodir=~/.vim/undo         "
set undofile                    "

"Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Disable Arrow keys in Insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

"Misc
set exrc                        " Loads directory specific .vimrc files
set noerrorbells                " Silence
"set colorcolumn=100             " Adds a colour marker on the # column
set signcolumn=yes              " 
set scrolloff=6                 " Keeps the cursor away from the top/bottom of the page
set showmatch		            " Show matching brackets.
set showcmd		                " Show (partial) command in status line.
set mouse=a		                " Enable mouse usage (all modes)
set wildmode=longest,list,full  " Enable autocomplete files
"set hidden		                " Hide buffers when they are abandoned

"WSL Cipboard
func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc
if !has("clipboard") && executable("clip.exe")
    noremap <C-C> :call system('clip.exe', GetSelectedText())<CR>       " TODO: replicate this with leader c
    noremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx    " TODO: replicate this with leader x
endif

"Change cursor in different modes
if &term =~ "xterm"
    autocmd VimEnter * silent !echo -ne "\e[2 q"
    let &t_SI = "\<Esc>[6 q"                        " Insert mode       Verticle bar
    let &t_SR = "\<Esc>[4 q"                        " Replace mode      underscore
    let &t_EI = "\<Esc>[2 q"                        " Normal mode       Block
endif
