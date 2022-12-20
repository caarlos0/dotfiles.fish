local harpoon = require("harpoon.ui")
local mark = require("harpoon.mark")
local opts = { noremap = true, silent = true }

function nav(i)
	return function()
		harpoon.nav_file(i)
	end
end

vim.keymap.set("n", "[j", harpoon.nav_prev, opts)
vim.keymap.set("n", "[k", harpoon.nav_next, opts)
vim.keymap.set("n", "<leader>m", function()
	mark.add_file()
	vim.notify("marked!")
end, opts)
vim.keymap.set("n", "<leader>fk", harpoon.toggle_quick_menu, opts)
vim.keymap.set("n", "<A-h>", nav(1), opts)
vim.keymap.set("n", "<A-j>", nav(2), opts)
vim.keymap.set("n", "<A-k>", nav(3), opts)
vim.keymap.set("n", "<A-l>", nav(4), opts)
