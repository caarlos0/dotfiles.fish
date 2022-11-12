require("nvim-tree").setup({
	view = {
		side = "right",
	},
})

vim.keymap.set("n", "<leader>tv", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
