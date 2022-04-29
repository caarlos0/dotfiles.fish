local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	return
end

catppuccin.setup({
	integrations = {
		which_key = true,
		neogit = true,
	},
})

vim.cmd([[
set background=dark
set termguicolors
colorscheme catppuccin
]])
