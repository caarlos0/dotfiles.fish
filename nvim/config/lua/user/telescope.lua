local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup()
telescope.load_extension("fzf")
telescope.load_extension("git_worktree")

local r = require("user.remap").nnoremap
r("<leader>ff", ":Telescope find_files<CR>")
r("<leader>fg", ":Telescope git_files<CR>")
r("<leader>of", ":Telescope oldfiles<CR>")
r("<leader>lg", ":Telescope live_grep<CR>")
r("<leader>fb", ":Telescope buffers<CR>")
r("<leader>fh", ":Telescope help_tags<CR>")
r("<leader>ft", ":Telescope treesitter<CR>")
r("<leader>fc", ":Telescope commands<CR>")
r("<leader>fr", ":Telescope resume<CR>")
