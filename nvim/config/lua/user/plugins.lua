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

packer.init({
	autoremove = true,
})

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use({
		"rmagatti/auto-session",
		config = function()
			require("user.session")
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("user.colorscheme")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
			vim.notify.setup({
				render = "minimal",
				stages = "fade",
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { focusable = false })
				end,
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
					blend = 0,
				},
			})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		after = "catppuccin",
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
		after = {
			"nvim-web-devicons",
			"catppuccin",
		},
		config = function()
			require("bufferline").setup({
				---@diagnostic disable-next-line: assign-type-mismatch
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				options = {
					diagnostics = "nvim_lsp",
				},
			})
		end,
	})

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
		after = { "harpoon" },
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-github.nvim",
		},
		config = function()
			require("user.telescope")
		end,
	})

	-- the whole lsp, luasnip and cmp gang
	use({
		"williamboman/mason.nvim",
		requires = {
			-- lsp
			"williamboman/mason-lspconfig.nvim",
			"onsails/lspkind-nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
			"onsails/lspkind-nvim",
			"simrat39/symbols-outline.nvim",

			-- cmp
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",

			-- cmp x lsp
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",

			-- snip x cmp
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",

			-- autopairs (x cmp)
			"windwp/nvim-autopairs",

			-- hints
			"simrat39/inlay-hints.nvim",
		},
		config = function()
			require("lspkind").init()
			require("luasnip").setup({
				-- see: https://github.com/L3MON4D3/LuaSnip/issues/525
				region_check_events = "InsertEnter",
				delete_check_events = "InsertLeave",
			})
			require("luasnip.loaders.from_vscode").lazy_load()
			require("nvim-autopairs").setup()
			require("user.lsp")
			require("user.symbols-outline")
			require("user.cmp")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({})
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

	use({
		"ojroques/vim-oscyank",
		config = function()
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
						vim.cmd([[OSCYankReg +]])
					end
				end,
				pattern = "*",
				group = vim.api.nvim_create_augroup("OSCYank", { clear = true }),
			})
		end,
	})

	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use("mhinz/vim-sayonara")
	use("ThePrimeagen/harpoon")
	use("editorconfig/editorconfig-vim")
	use("folke/zen-mode.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-abolish")
	use("tpope/vim-eunuch")
	use("tpope/vim-sleuth")
	use("mbbill/undotree")

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
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	group = vim.api.nvim_create_augroup("Packer", { clear = true }),
	pattern = "plugins.lua",
})
