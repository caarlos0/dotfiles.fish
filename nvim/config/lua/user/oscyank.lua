vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
			vim.cmd([[OSCYankReg +]])
		end
	end,
	pattern = "*",
	group = vim.api.nvim_create_augroup("OSCYank", { clear = true }),
})
