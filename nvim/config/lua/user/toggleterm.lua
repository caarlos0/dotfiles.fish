local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({})

require("user.remap").nnoremap("<leader>trm", "<cmd>:ToggleTerm<CR>")
