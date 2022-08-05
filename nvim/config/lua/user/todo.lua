require("todo-comments").setup({
	highlight = {
		keyword = "bg",
	},
})

local n = require("user.remap").nnoremap
n("<leader>xt", "<cmd>TodoTrouble<CR>")
n("<leader>lt", "<cmd>TodoTelescope<CR>")
