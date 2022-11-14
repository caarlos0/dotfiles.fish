local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
	},
})

local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", function()
	builtin.find_files({
		find_command = { "rg", "--hidden", "--files", "--smart-case", "--glob=!.git" },
	})
end, opts)
vim.keymap.set("n", "<leader>of", builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>lg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fc", builtin.commands, opts)
vim.keymap.set("n", "<leader>fr", builtin.resume, opts)
vim.keymap.set("n", "<leader>fq", builtin.quickfix, opts)
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<leader>xx", builtin.diagnostics, opts)
