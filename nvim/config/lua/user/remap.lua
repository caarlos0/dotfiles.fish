local opts = { noremap = true, silent = true }

local M = {}

M.nnoremap = function(key, cmd)
	vim.keymap.set("n", key, cmd, opts)
end

return M
