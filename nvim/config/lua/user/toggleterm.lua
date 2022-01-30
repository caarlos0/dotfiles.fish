local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup {}

vim.api.nvim_set_keymap("n", "<leader>trm", "<cmd>:ToggleTerm<CR>", {noremap = true, silent = true})

