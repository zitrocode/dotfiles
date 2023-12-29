local status, packer = pcall(require, 'packer')
if not status then return end

vim.cmd('packadd packer.nvim')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'

  -- LSP Plugins
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Other plugins
  use 'tpope/vim-commentary'
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'vim-airline/vim-airline'
  use 'windwp/nvim-autopairs'
  use 'alvan/vim-closetag'
  use 'preservim/nerdtree'
end)
