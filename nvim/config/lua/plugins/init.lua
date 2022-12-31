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
		"kyazdani42/nvim-web-devicons",
		priority = 999,
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-web-devicons", "catppuccin/nvim" },
		config = function()
			require("user.bufferline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-web-devicons", "catppuccin/nvim" },
		config = function()
			require("user.lualine")
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("user.autosession")
		end,
	},
}
