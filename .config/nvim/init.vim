let HARDMODE=0

let mapleader=" "
"set mouse=a		                " Enable mouse usage (all modes)

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
match errorMsg /\s\+$/           " Marks trailing whitespace as an error

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
vnoremap H <gv
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap L >gv

"Clipboard
if !has("clipboard") && executable("clip.exe")
    vnoremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
    vnoremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx
    vnoremap <leader>y :call system('clip.exe', GetSelectedText())<CR>
    vnoremap <leader>x :call system('clip.exe', GetSelectedText())<CR>gvx
else
    vnoremap <C-c> "+y
    vnoremap <C-x> "+ygvx
    noremap <C-S-v> "+p
    vnoremap <leader>y "+y
    vnoremap <leader>x "+ygvx
    noremap <leader>v "+p
endif

"set spellcheck
nnoremap <leader>l :setlocal spell spell! spelllang=en_gb<CR>

"run shellcheck on current file
nnoremap <leader>p :!clear && shellcheck %<cr>

"Open windows
nnoremap <leader>o :vsp .<cr>
"nnoremap <leader>t :vertical terminal<cr>

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

"misc
nnoremap " :norm zto""""""<CR><Left><Left>i
nnoremap U <C-R>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Colours
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
"Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'alexaandru/nvim-lspupdate'
"Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"Extra info
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
"git
Plug 'airblade/vim-gitgutter'
"Functionality
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'vim-syntastic/syntastic'
"Uhm..TODO:Remember why I added these
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
"Android studio integration
"Plug 'beeender/Comrade'
call plug#end()

"coc
let g:coc_global_extensions = [
    \ 'coc-pairs'
    \ ]
"Which key maps
nnoremap <silent> <leader> :WhichKey '<Space>'<cr>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<cr>
"airline
let g:airline#extensions#tabline#enabled = 1
"colorscheme
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
highlight ColorColumn ctermbg=8
highlight Normal ctermbg=none
highlight NonText ctermbg=none
"GitGutter
let g:gitgutter_terminal_reports_focus=0
nnoremap <leader>gh :GitGutterLineHighlightsToggle<cr>
nnoremap <leader>gc :GitGutterEnable<cr>
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Airline Syntastic  
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = 'E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'
"vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"Lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
require('lspconfig').ansiblels.setup{ on_attach=on_attach }
require('lspconfig').bashls.setup{ on_attach=on_attach }
require('lspconfig').clangd.setup{ on_attach=on_attach, filetypes = { "c", "cpp", "objc", "objcpp", "ino" } }
require('lspconfig').dockerls.setup{ on_attach=on_attach }
require('lspconfig').jsonls.setup{ on_attach=on_attach }
require('lspconfig').pyright.setup{ on_attach=on_attach }
require('lspconfig').texlab.setup{ on_attach=on_attach }
require('lspconfig').vimls.setup{ on_attach=on_attach }
require('lspconfig').yamlls.setup{ on_attach=on_attach }
EOF
"nvim-compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Telescope
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extentions = {
        fzy_native = {
            overide_generic_sorter = false,
            overide_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = '< init.vim >',
        cwd = '~/.config/nvim/',
    })
end

return M

EOF

nnoremap <leader>t :Telescope find_files<cr>
