vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.dockerfile",
	command = "set ft=dockerfile",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.txt", "*.md", "*.tex", "gitcommit", "gitrebase" },
	command = "setlocal spell",
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
		vim.cmd([[ if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg +' | endif ]])
	end,
	pattern = "*",
})

-- [[ Mkdir, reopen file and trim whitespace on save ]]
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
			vim.cmd([[e]]) -- reopen file so gopls et al work properly
		end
		vim.cmd([[
			let save = winsaveview()
			keeppatterns %s/\s\+$//e
			call winrestview(save)
		]])
	end,
	pattern = "*",
})
