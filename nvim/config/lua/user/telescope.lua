local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<Tab>"] = actions.move_selection_previous,
				["<S-Tab>"] = actions.move_selection_next,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git",
		},
		prompt_prefix = "   ",
		color_devicons = true,
	},
})

local r = require("user.remap").nnoremap
r("<C-p>", ":Telescope find_files find_command=rg,--hidden,--files,--smart-case,--glob=!.git<CR>")
r("<leader>of", ":Telescope oldfiles<CR>")
r("<leader>lg", ":Telescope live_grep<CR>")
r("<leader>fb", ":Telescope buffers<CR>")
r("<leader>fh", ":Telescope help_tags<CR>")
r("<leader>ft", ":Telescope treesitter<CR>")
r("<leader>fc", ":Telescope commands<CR>")
r("<leader>fr", ":Telescope resume<CR>")
r("<leader>fq", ":Telescope quickfix<CR>")
r("<leader>/", ":Telescope current_buffer_fuzzy_find<CR>")
