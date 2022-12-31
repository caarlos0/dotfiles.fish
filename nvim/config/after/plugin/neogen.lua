local neogen = require("neogen")
neogen.setup({})
vim.keymap.set("n", "<Leader>nf", neogen.generate, {
	noremap = true,
	silent = true,
	desc = "Neogen generate",
})
