local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	direction = "float",
})

require("user.remap").nnoremap("<leader>trm", "<cmd>:ToggleTerm<CR>")
