vim.cmd([[
    augroup packer-updater
        autocmd!
        autocmd BufWritePost packer-init.lua source <afile> | PackerSync
    augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    --Self manage packer
    use 'wbthomason/packer.nvim'
    --Colours
    use 'morhetz/gruvbox'
    use 'tomasiser/vim-code-dark'
    --Lsp
    use 'neovim/nvim-lspconfig'
    use 'alexaandru/nvim-lspupdate'
    --use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'simrat39/symbols-outline.nvim'
    --nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'onsails/lspkind-nvim'
    --Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'
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
    use 'norcalli/nvim-colorizer.lua'
    --git
    use 'airblade/vim-gitgutter'
    --Functionality
    use 'terryma/vim-multiple-cursors'
    use 'tpope/vim-surround'
    use 'vim-syntastic/syntastic'
    use 'windwp/nvim-autopairs'
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-repeat'
    --Android studio integration
    use { 'beeender/Comrade', opt = true }

    --Autoinstall packer if not yet setup
    if packer_bootstrap then
        require('packer').sync()
    end
end)
