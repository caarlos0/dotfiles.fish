-- ls lua/rc/*.lua | sed -e 's;^lua/rc/;require "rc.;g' -e 's/\.lua$/"/g'

require "rc.options"
require "rc.keymaps"
require "rc.autocommands"
require "rc.plugins"
require "rc.colorscheme"

require "rc.toggleterm"
require "rc.autopairs"
require "rc.gitsigns"
require "rc.cmp"
require "rc.git-worktree"
require "rc.lsp"
require "rc.lualine"
require "rc.telescope"
require "rc.test"
require "rc.tree"
require "rc.treesitter"
require "rc.trouble"
require "rc.vsnip"

