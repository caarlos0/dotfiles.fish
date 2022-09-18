vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.dockerfile",
	command = "set ft=dockerfile",
	group = vim.api.nvim_create_augroup("Dockerfile", { clear = true }),
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.txt", "*.md", "*.tex", "gitcommit", "gitrebase", "NeogitCommitMessage" },
	command = "setlocal spell",
	group = vim.api.nvim_create_augroup("Spell", { clear = true }),
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "NeogitCommitMessage" },
	command = "startinsert",
	group = vim.api.nvim_create_augroup("AutoInsert", { clear = true }),
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
	group = vim.api.nvim_create_augroup("Mkdir", { clear = true }),
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
	group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = "*",
	group = vim.api.nvim_create_augroup("Highlight", { clear = true }),
})
