local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
	},
})

local builtin = require("telescope.builtin")
local r = require("user.remap").nnoremap
r("<C-p>", function()
	builtin.find_files({
		hidden = true,
	})
end)
r("<leader>of", builtin.oldfiles)
r("<leader>lg", builtin.live_grep)
r("<leader>fb", builtin.buffers)
r("<leader>fh", builtin.help_tags)
r("<leader>fc", builtin.commands)
r("<leader>fr", builtin.resume)
r("<leader>fq", builtin.quickfix)
r("<leader>/", builtin.current_buffer_fuzzy_find)
