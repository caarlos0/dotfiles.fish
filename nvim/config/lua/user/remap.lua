local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local M = {}

M.nnoremap = function(key, cmd)
	keymap("n", key, cmd, opts)
end

return M
