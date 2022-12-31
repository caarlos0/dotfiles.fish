return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "InsertEnter",
		config = true,
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
		config = {
			highlight = {
				keyword = "bg",
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = true,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = {
			text = { spinner = "dots" },
			window = { blend = 0 },
		},
	},
	{
		"danymat/neogen",
		event = "BufEnter",
		config = function()
			require("user.neogen")
		end,
	},
	{
		"vim-test/vim-test",
		event = "BufEnter",
		config = function()
			require("user.test")
		end,
	},
	{
		"ojroques/vim-oscyank",
		event = "BufEnter",
		config = function()
			require("user.oscyank")
		end,
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("user.notify")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		config = function()
			require("user.harpoon")
		end,
	},
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		config = function()
			require("user.zenmode")
		end,
	},
	{
		"tpope/vim-fugitive",
		command = "Git",
		config = function()
			require("user.fugitive")
		end,
		keys = {
			{ "<leader>gs", vim.cmd.Git, desc = "Open Git" },
		},
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{ "<leader>tv", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = {
			filesystem = {
				follow_current_file = true,
				hijack_netrw_behavior = "open_current",
			},
		},
	},
	{
		"mhinz/vim-sayonara",
		event = "VeryLazy",
	},
	{
		"tpope/vim-abolish",
		event = "InsertEnter",
		config = function()
			local abolishes = {
				Goreleaser = "GoReleaser",
				gorelesaer = "goreleaser",
				carlos0 = "caarlos0",
				descriptoin = "description",
				fucn = "func",
				sicne = "since",
			}
			for a, b in pairs(abolishes) do
				vim.cmd("Abolish " .. a .. " " .. b)
			end
		end,
	},
	{ "editorconfig/editorconfig-vim", event = "BufEnter" },
	{ "tpope/vim-repeat", event = "BufEnter" },
	{ "tpope/vim-eunuch", event = "BufEnter" },
	{ "tpope/vim-sleuth", event = "BufEnter" },
	{ "tpope/vim-speeddating", event = "BufEnter" },
}
