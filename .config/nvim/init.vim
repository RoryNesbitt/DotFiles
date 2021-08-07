let HARDMODE=0

let mapleader=" "
set mouse=a		                " Enable mouse usage (all modes)

"visual
set t_Co=256                    "
set cursorline                  " Highlights the current line
set cursorcolumn                " Highlights the current column
highlight CursorLine ctermbg=black cterm=bold
highlight Cursorcolumn ctermbg=black cterm=bold
set nowrap                      " Long lines won't wrap
set colorcolumn=80              " Adds a colour marker on the # column
set signcolumn=yes              " Left side info column
set scrolloff=4                 " Keeps the cursor away from the screen edge

"Tabs
set tabstop=4 softtabstop=4     "
set shiftwidth=4                "
set expandtab                   "
set smartindent                 "

"Numbers
set number                      "
set relativenumber              "

"Search
set nohlsearch                  " Stop hl when search stops
set ignorecase		            " Do case insensitive matching
set smartcase		            " Do smart case matching

"History
set noswapfile                  "
set nobackup                    "
set undofile                    "
set hidden		                " Hide buffers when they are abandoned

"splitview
set splitbelow                  " split down
set splitright                  " vertical split right

"Misc
set exrc                        " Loads directory specific .vimrc files
set noerrorbells                " Silence
set showmatch		            " Show matching brackets.
set showcmd		                " Show (partial) command in status line.
set wildmode=longest,list,full  " Enable autocomplete files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AutoCmds
augroup RND
    autocmd!
    "remove trailing whitespace
    autocmd BufWritePre * %s/\s\+$//e
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts

if HARDMODE
    "Disable Arrow keys in Normal mode
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    "Disable hjkl in Normal mode
    map h <nop>
    map j <nop>
    map k <nop>
    map l <nop>
    "Disable Arrow keys in Insert mode
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>
endif

"Center to focus
nnoremap { {zz
nnoremap } }zz
"nnoremap i zzi

"Move line
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

"WSL clipboard
if !has("clipboard") && executable("clip.exe")
    noremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
    noremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx
    noremap <leader>c :call system('clip.exe', GetSelectedText())<CR>
    noremap <leader>x :call system('clip.exe', GetSelectedText())<CR>gvx
endif

"set spellcheck
nnoremap <leader>l :setlocal spell spell! spelllang=en_gb<CR>

"run shellcheck on current file
nnoremap <leader>p :!clear && shellcheck %<cr>

"Open windows
nnoremap <leader>o :vsp .<cr>
nnoremap <leader>t :vertical terminal<cr>

"split navigation
noremap <C-h> <c-w>h
noremap <C-j> <c-w>j
noremap <C-k> <c-w>k
noremap <C-l> <c-w>l
noremap <leader>h :wincmd h<cr>
noremap <leader>j :wincmd j<cr>
noremap <leader>k :wincmd k<cr>
noremap <leader>l :wincmd l<cr>

"search
"replace in line
noremap <leader>s :s//gI<Left><Left><Left>
"replace in file
noremap <leader>S :%s//gI<Left><Left><Left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/NERDTree'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
call plug#end()
"coc
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-pairs'
    \ ]

"NERDTree
noremap <F5> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeShowHidden=1
"airline
let g:airline#extensions#tabline#enabled = 1
"colorscheme
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
highlight ColorColumn ctermbg=8
"GitGutter
let g:gitgutter_terminal_reports_focus=0
nnoremap <leader>gh :GitGutterLineHighlightsToggle<cr>
nnoremap <leader>gc :GitGutterEnable<cr>
"coc
let g:coc_disable_startup_warning = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx,*.tsx'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the
" specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing
" in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g.
" `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
