local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.load_extension("fzf")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>of", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>fc", ":Telescope commands<CR>", opts)
