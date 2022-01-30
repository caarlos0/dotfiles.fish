require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.plugins"
require "user.colorscheme"

require "user.toggleterm"
require "user.neogit"
require "user.autopairs"
require "user.gitsigns"
require "user.cmp"
require "user.git-worktree"
require "user.lsp"
require "user.lualine"
require "user.telescope"
require "user.test"
require "user.tree"
require "user.treesitter"
require "user.trouble"
require "user.snip"


-- generate the later part of the list
-- ls lua/user/*.lua | grep -Ev 'options|keymap|autocommands|plugin|colorscheme' | sed -e 's;^lua/user/;require "user.;g' -e 's/\.lua$/"/g'
--
