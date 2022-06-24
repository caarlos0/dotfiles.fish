local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("lewis6991/impatient.nvim")

	-- ui
	use("gruvbox-community/gruvbox")
	use("stevearc/dressing.nvim")
	use("j-hui/fidget.nvim")
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("akinsho/toggleterm.nvim")
	use("karb94/neoscroll.nvim")

	-- basic functionality
	use("windwp/nvim-autopairs")
	use("editorconfig/editorconfig-vim")
	use("numToStr/Comment.nvim")
	use("folke/which-key.nvim")
	use("famiu/bufdelete.nvim")
	use("folke/todo-comments.nvim")
	use("Pocco81/AutoSave.nvim")
	use("ojroques/vim-oscyank")
	use("ellisonleao/glow.nvim")
	use("tpope/vim-abolish")
	use("triglav/vim-visual-increment")
	use("tpope/vim-speeddating")
	use("tpope/vim-eunuch")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use({
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
	})

	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-github.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- all things lsp, syntax highlight, snippets, etc
	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp-status.nvim")
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("folke/trouble.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")

	use("onsails/lspkind-nvim")
	use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")
	use("RRethy/vim-illuminate")

	-- debugging
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")

	-- git
	use({
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	})

	-- testing et al
	use("vim-test/vim-test")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if is_bootstrap then
		packer.sync()
	end
end)

if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
