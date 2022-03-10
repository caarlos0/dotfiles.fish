local ok, worktree = pcall(require, "git-worktree")
if not ok then
	return
end

worktree.setup()

local r = require("user.remap").nnoremap
r("<leader>gws", ":Telescope git_worktree git_worktrees<CR>")
r("<leader>gwc", ":Telescope git_worktree create_git_worktree<CR>")
