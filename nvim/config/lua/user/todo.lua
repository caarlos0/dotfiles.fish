local ok, todo = pcall(require, "todo-comments")
if not ok then
	return
end

todo.setup({
	highlight = {
		keyword = "bg",
	},
})

local n = require("user.remap").nnoremap
n("<leader>xt", "<cmd>TodoTrouble<CR>")
n("<leader>lt", "<cmd>TodoTelescope<CR>")
