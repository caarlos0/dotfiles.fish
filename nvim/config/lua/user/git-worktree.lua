require("git-worktree").setup({})
require("telescope").load_extension("git_worktree")

local r = require("user.remap")
r("<leader>gws", ":Telescope git_worktree git_worktrees<CR>")
r("<leader>gwc", ":Telescope git_worktree create_git_worktree<CR>")
