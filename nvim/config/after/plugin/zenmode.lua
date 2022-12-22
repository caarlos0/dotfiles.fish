local zz = require("zen-mode")
zz.setup({
	window = {
		width = 220,
		options = {
			number = true,
			relativenumber = true,
		},
	},
})

vim.keymap.set("n", "<leader>zz", zz.toggle, {
	silent = true,
	noremap = true,
	desc = "Toggle Zen mode",
})
