local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

lualine.setup({
	options = {
		theme = "gruvbox",
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_c = {
			{
				"filetype",
				icon_only = true,
			},
			{
				"filename",
				file_status = false,
				path = 1,
			},
		},
		lualine_x = {
			function()
				return require("lsp-status").status()
			end,
			"encoding",
		},
	},
})
