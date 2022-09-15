require("lualine").setup({
	options = {
		theme = "catppuccin",
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
