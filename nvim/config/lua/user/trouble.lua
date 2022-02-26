local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup({})

require("user.remap").nnoremap("<leader>tx", "<cmd>TroubleToggle<CR>")
