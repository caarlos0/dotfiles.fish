local ok, neogit = pcall(require, "neogit")
if not ok then
	return
end

neogit.setup({
  disable_commit_confirmation = true,
  disable_context_highlighting = true,
})

vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit<CR>', { noremap = true, silent = true })
