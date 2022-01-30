local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	view = {
		side = "right",
	},
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>ttt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tff", ":NvimTreeFindFile<CR>", opts)
