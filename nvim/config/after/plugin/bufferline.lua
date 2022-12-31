require("bufferline").setup({
	---@diagnostic disable-next-line: assign-type-mismatch
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		diagnostics = "nvim_lsp",
	},
})
