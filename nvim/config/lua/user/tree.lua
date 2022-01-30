local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	view = {
		side = "right",
	},
})

require("user.remap").nnoremap("<leader>tv", "<cmd>NvimTreeToggle<CR>")
