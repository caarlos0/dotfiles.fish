local nnn = require("no-neck-pain")
nnn.setup({
	width = 220,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = vim.api.nvim_create_augroup("nnn", { clear = true }),
	pattern = "*",
	callback = function()
		vim.schedule(function()
			nnn.enable()
		end)
	end,
})
