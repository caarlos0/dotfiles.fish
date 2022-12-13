require("symbols-outline").setup({
	width = 25,
})

vim.keymap.set("n", "<leader>smb", vim.cmd.SymbolsOutline, { noremap = true, silent = true })
