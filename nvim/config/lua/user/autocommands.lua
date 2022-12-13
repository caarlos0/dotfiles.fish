vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.dockerfile",
	callback = function()
		vim.opt_local.ft = "dockerfile"
	end,
	group = vim.api.nvim_create_augroup("Dockerfile", { clear = true }),
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"gitcommit",
	},
	command = "startinsert",
	group = vim.api.nvim_create_augroup("AutoInsert", { clear = true }),
})

-- ensure the parent folder exists, so it gets properly added to the lsp
-- context and everything just works.
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
	pattern = "*",
	callback = function()
		vim.cmd([[
			let save = winsaveview()
			keeppatterns %s/\s\+$//e
			call winrestview(save)
		]])
	end,
	group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("Highlight", { clear = true }),
})
