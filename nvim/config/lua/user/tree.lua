require("nvim-tree").setup({
	view = {
		side = "right",
	},
})

vim.keymap.set("n", "<leader>tv", vim.cmd.NvimTreeToggle, { noremap = true, silent = true })
