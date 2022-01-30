require("git-worktree").setup {}
require("telescope").load_extension("git_worktree")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<leader>gws', ':Telescope git_worktree git_worktrees<CR>', opts)
keymap('n', '<leader>gwc', ':Telescope git_worktree create_git_worktree<CR>', opts)
