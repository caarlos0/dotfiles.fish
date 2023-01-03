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

-- [[ Jump to the " mark when reading a buffer ]]
-- It will search mark " which contains the cursor position when last
-- exiting the buffer and set the cursor position to that location.
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  group = vim.api.nvim_create_augroup("OpenInLastPosition", { clear = true }),
})
