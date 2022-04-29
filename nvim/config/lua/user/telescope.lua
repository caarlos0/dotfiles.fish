local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup({})
telescope.load_extension("fzf")
telescope.load_extension("gh")

local r = require("user.remap").nnoremap
r("<leader>ff", ":Telescope find_files<CR>")
r("<C-p>", ":Telescope git_files<CR>")
r("<leader>of", ":Telescope oldfiles<CR>")
r("<leader>lg", ":Telescope live_grep<CR>")
r("<leader>fb", ":Telescope buffers<CR>")
r("<leader>fh", ":Telescope help_tags<CR>")
r("<leader>ft", ":Telescope treesitter<CR>")
r("<leader>fc", ":Telescope commands<CR>")
r("<leader>fr", ":Telescope resume<CR>")
r("<leader>fq", ":Telescope quickfix<CR>")
r("<leader>fgi", ":Telescope gh issues<CR>")
r("<leader>fgp", ":Telescope gh pull_requests<CR>")
