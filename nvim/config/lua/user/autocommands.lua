vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.dockerfile",
	command = "set ft=dockerfile",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.txt", "*.md", "*.tex", "gitcommit", "gitrebase" },
	command = "setlocal spell",
})

-- ensure the parent folder exists, so it gets properly added to the lsp context and everything just works.
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*",
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
			vim.cmd([[ :e % ]])
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd([[
			let save = winsaveview()
			keeppatterns %s/\s\+$//e
			call winrestview(save)
		]])
	end,
	pattern = "*",
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = "*",
})
