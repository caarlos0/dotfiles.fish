return {
	{
		"catppuccin/nvim",
		as = "catppuccin",
		priority = 1000,
		config = function()
			require("user.colorscheme")
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
		dependencies = { "nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-github.nvim",
			"ThePrimeagen/harpoon",
		},
	},
	{
		"williamboman/mason.nvim",
		event = "BufEnter",
		dependencies = {
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
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "InsertEnter" },
	{ "kylechui/nvim-surround", event = "InsertEnter" },
	{ "lewis6991/gitsigns.nvim", event = "BufEnter" },
	{ "folke/todo-comments.nvim", event = "BufEnter" },
	{ "numToStr/Comment.nvim", event = "InsertEnter" },
	{ "stevearc/dressing.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "j-hui/fidget.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "danymat/neogen" },
	{ "vim-test/vim-test" },
	{ "ojroques/vim-oscyank", event = "BufEnter" },
	{ "rmagatti/auto-session" },
	{ "rcarriga/nvim-notify" },
	{ "mhinz/vim-sayonara" },
	{ "ThePrimeagen/harpoon" },
	{ "editorconfig/editorconfig-vim" },
	{ "folke/zen-mode.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-abolish" },
	{ "tpope/vim-eunuch" },
	{ "tpope/vim-sleuth" },
	{ "mbbill/undotree" },
	{ "folke/which-key.nvim" },
}
