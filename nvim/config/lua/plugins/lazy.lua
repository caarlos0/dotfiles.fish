return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "InsertEnter",
		config = function()
			require("indent_blankline").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
		config = function()
			require("user.todo")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("user.fidget")
		end,
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
		init = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {
				noremap = true,
				silent = true,
				desc = "Open Git",
			})
		end,
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
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		event = "VeryLazy",
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
		"mhinz/vim-sayonara",
		event = "VeryLazy",
	},
	{
		"tpope/vim-abolish",
		event = "InsertEnter",
		config = function()
			for a, b in pairs({
				Goreleaser = "GoReleaser",
				gorelesaer = "goreleaser",
				carlos0 = "caarlos0",
				descriptoin = "description",
				fucn = "func",
				sicne = "since",
			}) do
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
