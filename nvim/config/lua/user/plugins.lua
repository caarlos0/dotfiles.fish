return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("user.colorscheme")
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("user.session")
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				render = "minimal",
				stages = "fade",
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { focusable = false })
				end,
			})
			vim.notify = notify
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		lazy = false,
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	},

	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({})
		end,
	},

	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
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
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("user.lualine")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		init = function()
			vim.keymap.set("n", "<leader>tv", vim.cmd.NvimTreeToggle, {
				noremap = true,
				silent = true,
				desc = "Toggle Tree",
			})
		end,
		config = function()
			require("nvim-tree").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				---@diagnostic disable-next-line: assign-type-mismatch
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				options = {
					diagnostics = "nvim_lsp",
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},

	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				highlight = {
					keyword = "bg",
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-github.nvim",
		},
		config = function()
			require("user.telescope")
		end,
	},
	{
		"williamboman/mason.nvim",
		event = "BufReadPost",
		dependencies = {
			-- lsp
			"williamboman/mason-lspconfig.nvim",
			"onsails/lspkind-nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
			"onsails/lspkind-nvim",

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
			require("user.cmp")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup({
				width = 25,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("user.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
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
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		init = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
				desc = "Toggle undotree",
			})
		end,
	},
	{ "vim-test/vim-test", event = "BufReadPost" },
	"ThePrimeagen/harpoon",
	"editorconfig/editorconfig-vim",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"tpope/vim-abolish",
	"tpope/vim-eunuch",
	"tpope/vim-sleuth",
	"mhinz/vim-sayonara",
}
