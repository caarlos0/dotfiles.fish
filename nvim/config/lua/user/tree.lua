require("nvim-tree").setup({
	view = {
		side = "right",
	},
})

require("user.remap").nnoremap("<leader>tv", "<cmd>NvimTreeToggle<CR>")
