local ok, neogit = pcall(require, "neogit")
if not ok then
	return
end

neogit.setup({
	disable_commit_confirmation = true,
	disable_context_highlighting = true,
})

require("user.remap").nnoremap("<leader>gs", "<cmd>Neogit<CR>")
