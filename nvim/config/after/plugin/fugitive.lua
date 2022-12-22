vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {
	noremap = true,
	silent = true,
	desc = "Open Git",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("user-fugitive", { clear = true }),
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "<leader>Pp", function()
			vim.cmd.Git("push")
		end, opts)
	end,
})
