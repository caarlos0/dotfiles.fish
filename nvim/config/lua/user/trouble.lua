local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup({})

local r = require("user.remap").nnoremap
r("<leader>xx", "<cmd>TroubleToggle<CR>")
r("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
r("<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
r("<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
r("<leader>xl", "<cmd>TroubleToggle loclist<CR>")
