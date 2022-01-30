vim.g.symbols_outline = {
	width = 50,
}

vim.api.nvim_set_keymap("n", "<leader>smb", "<cmd>:SymbolsOutline<CR>", { noremap = true, silent = true })
