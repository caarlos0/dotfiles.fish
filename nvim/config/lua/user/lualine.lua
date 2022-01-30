local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

lualine.setup({
	options = {
		theme = "dracula",
	},
})
