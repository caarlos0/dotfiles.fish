require("symbols-outline").setup({
	width = 25,
})

vim.keymap.set("n", "<leader>smb", "<cmd>SymbolsOutline<CR>", { noremap = true, silent = true })
