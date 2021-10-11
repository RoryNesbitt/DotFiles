require('packer').startup(function()
--Self manage packer
    use 'wbthomason/packer.nvim'
--coc
    use { 'neoclide/coc.nvim', branch = 'release'}
--Colours
    use 'morhetz/gruvbox'
    use 'tomasiser/vim-code-dark'
--Lsp
    use 'neovim/nvim-lspconfig'
    use 'alexaandru/nvim-lspupdate'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'simrat39/symbols-outline.nvim'
--Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
--Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
--Extra info
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'liuchengxu/vim-which-key'
    use 'ryanoasis/vim-devicons'
    use 'tpope/vim-fugitive'
--git
    use 'airblade/vim-gitgutter'
--Functionality
    use 'terryma/vim-multiple-cursors'
    use 'tpope/vim-surround'
    use { 'alvan/vim-closetag',
        ft = {'html'}
    }
    use 'vim-syntastic/syntastic'
--Uhm..TODO:Remember why I added these
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-repeat'
--Android studio integration
    use { 'beeender/Comrade', opt = true }
end)
