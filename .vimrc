let mapleader=" "
syntax on                       " Syntax highlighting
set background=dark             " changs the colours to fit with a dark background
filetype plugin indent on       " enable file type indenting && language dependent indenting

"Tabs
set tabstop=4 softtabstop=4     "
set shiftwidth=4                "
set expandtab                   "
set smartindent                 "
set autoindent                  "

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

"colours
set termguicolors
colorscheme codedark

"cursor lines
"set cursorline
set cursorcolumn
"highlight CursorLine ctermbg=yellow cterm=bold guibg=#2b2b2b
highlight Cursorcolumn ctermbg=yellow cterm=bold guibg=#2b2b2b

"splitview
set splitbelow                  " split down
set splitright                  " vertical split right

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"WSL
"WSL Cipboard
func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc

"Change cursor in different modes
if &term =~ "xterm"
    autocmd VimEnter * silent !echo -ne "\e[2 q"
    let &t_SI = "\<Esc>[6 q"                        " Insert mode       Verticle bar
    let &t_SR = "\<Esc>[4 q"                        " Replace mode      underscore
    let &t_EI = "\<Esc>[2 q"                        " Normal mode       Block
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AutoCmds
"remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
"WSL clipboard
if !has("clipboard") && executable("clip.exe")
    noremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
    noremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx
    noremap <leader>c :call system('clip.exe', GetSelectedText())<CR>
    noremap <leader>x :call system('clip.exe', GetSelectedText())<CR>gvx
endif

"set spellcheck
map <leader>l :setlocal spell spell! spelllang=en_gb<CR>

"run shellcheck on current file
map <leader>p :!clear && shellcheck %<cr>

"split navigation
map <C-h> <c-w>h
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l

"search
noremap <leader>s :s//gI<Left><Left><Left>          " replace in line
noremap <leader>S :%s//gI<Left><Left><Left>         " replace in file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
call plug#end()

"NERDTree
map <F5> :NERDTreeToggle<CR>
"airline
let g:airline#extensions#tabline#enabled = 1
