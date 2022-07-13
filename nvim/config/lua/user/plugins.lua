local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
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

	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				auto_save_enabled = true,
				auto_restore_enables = true,
			})
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})

	use({
		"gruvbox-community/gruvbox",
		config = function()
			require("user.colorscheme")
		end,
	})

	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({})
		end,
	})

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots",
				},
				window = {
					relative = "win",
					blend = 0,
				},
			})
		end,
	})

	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			require("autosave").setup({
				events = { "FocusLost" },
				write_all_buffers = true,
			})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-lua/lsp-status.nvim",
		},
		config = function()
			require("user.lualine")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("user.tree")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
				},
			})
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.toggleterm")
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("editorconfig/editorconfig-vim")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		config = function()
			require("user.todo")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("user.telescope")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
	})

	use({
		"onsails/lspkind-nvim",
		config = function()
			require("lspkind").init()
		end,
	})

	use({
		"williamboman/nvim-lsp-installer",
		requires = {
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
			"nvim-lua/lsp-status.nvim",
			"onsails/lspkind-nvim",
			"simrat39/symbols-outline.nvim",
			"ray-x/lsp_signature.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("user.lsp")
			require("user.symbols-outline")
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").load()
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("user.trouble")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("user.treesitter")
		end,
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"lewis6991/spellsitter.nvim",
		},
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("user.debug")
		end,
		requires = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"vim-test/vim-test",
		config = function()
			require("user.test")
		end,
	})

	use("famiu/bufdelete.nvim")
	use("ojroques/vim-oscyank")
	use("tpope/vim-abolish")
	use("triglav/vim-visual-increment")
	use("tpope/vim-speeddating")
	use("tpope/vim-eunuch")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if is_bootstrap then
		packer.sync()
	end
end)

if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	group = packer_group,
	pattern = "plugins.lua",
})
