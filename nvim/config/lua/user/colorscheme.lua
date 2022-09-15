vim.g.catppuccin_flavour = "mocha"

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin").setup({
	custom_highlights = {
		Comment = { fg = colors.overlay1 },
		LineNr = { fg = colors.overlay1 },
	},
})

vim.cmd([[
set background=dark
set termguicolors
colorscheme catppuccin
]])
