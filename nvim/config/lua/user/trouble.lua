local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup({})
vim.api.nvim_set_keymap("n", "<leader>xx", ":TroubleToggle<CR>", { noremap = true, silent = true })
