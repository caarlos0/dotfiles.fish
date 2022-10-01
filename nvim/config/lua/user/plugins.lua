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
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("user.session")
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
		"catppuccin/nvim",
		as = "catppuccin",
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
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				trigger_events = {
					"FocusLost",
				},
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
		requires = {
			"mhinz/vim-sayonara",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					close_command = "Sayonara!", -- can be a string | function, see "Mouse actions"
					right_mouse_command = "Sayonara!", -- can be a string | function, see "Mouse actions"
					highlights = require("catppuccin.groups.integrations.bufferline").get(),
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
		},
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
			"nvim-lua/lsp-status.nvim",
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
		},
		config = function()
			require("lspkind").init()
			require("luasnip").setup({
				-- see: https://github.com/L3MON4D3/LuaSnip/issues/525
				region_check_events = "CursorHold,InsertLeave,InsertEnter",
				delete_check_events = "TextChanged,InsertEnter",
			})
			require("nvim-autopairs").setup()
			require("luasnip.loaders.from_vscode").load()
			require("user.lsp")
			require("user.symbols-outline")
			require("user.cmp")
		end,
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
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({
				disable_commit_confirmation = true,
				disable_context_highlighting = true,
				disable_signs = true,
				disable_hint = true,
			})
			require("user.remap").nnoremap("<leader>gs", ":Neogit<CR>")
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
					vim.cmd([[
						if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg +' | endif
					]])
				end,
				pattern = "*",
				group = vim.api.nvim_create_augroup("OSCYank", { clear = true }),
			})
		end,
	})

	use("editorconfig/editorconfig-vim")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-abolish")
	use("tpope/vim-eunuch")
	-- use("dstein64/vim-startuptime")

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
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	command = "source <afile> | PackerSync",
-- 	group = vim.api.nvim_create_augroup("Packer", { clear = true }),
-- 	pattern = "plugins.lua",
-- })
