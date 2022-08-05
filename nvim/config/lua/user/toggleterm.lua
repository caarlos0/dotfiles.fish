require("toggleterm").setup({
	direction = "float",
})

require("user.remap").nnoremap("<leader>trm", "<cmd>:ToggleTerm<CR>")
