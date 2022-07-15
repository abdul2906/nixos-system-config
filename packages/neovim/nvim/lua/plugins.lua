-- Bootstrap packer installation
local path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(path)) > 0 then
  Packer_bootstrap = vim.fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      path
  })
end

-- Autocompile plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local success, packer = pcall(require, "packer")
if not success then
  return
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
--  use 'ellisonleao/gruvbox.nvim'
  use 'fneu/breezy'

  -- completions
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- telescope
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"

  -- nix
  use "LnL7/vim-nix"

  if Packer_bootstrap then
      require("packer").sync()
  end
end)

