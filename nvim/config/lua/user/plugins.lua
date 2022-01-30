local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

    -- ui
  use {
      'dracula/vim',
      as = 'dracula',
  }
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- basic functionality
  use "terryma/vim-multiple-cursors"
  use "windwp/nvim-autopairs"
  use "kyazdani42/nvim-tree.lua"
  use "editorconfig/editorconfig-vim"
  use {
    "numToStr/Comment.nvim",
    config = function()
        require('Comment').setup()
    end
  }
  use "akinsho/toggleterm.nvim"
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  -- telescope
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use {
	  "nvim-telescope/telescope-fzf-native.nvim",
	  run = "make",
  }

  -- all things lsp, syntax highlight, snippets, etc
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "folke/trouble.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "onsails/lspkind-nvim"

  -- git
  use "TimUntersberger/neogit"
  use "lewis6991/gitsigns.nvim"
  use "ThePrimeagen/git-worktree.nvim"

  -- testing et al
  use "vim-test/vim-test"


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
