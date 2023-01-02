local harpoon = require("harpoon.ui")
local mark = require("harpoon.mark")

local function nav(i)
  return function()
    harpoon.nav_file(i)
  end
end

local function k(key, fn, desc)
  vim.keymap.set("n", key, fn, {
    noremap = true,
    silent = true,
    desc = desc,
  })
end

k("[j", harpoon.nav_prev, "Harpoon previous")
k("[k", harpoon.nav_next, "Harpoon next")
k("<leader>m", mark.add_file, "Harpoon mark current file")
k("<leader>fk", harpoon.toggle_quick_menu, "Harpoon toggle quick menu")
k("<A-h>", nav(1), "Harpoon go to file 1")
k("<A-j>", nav(2), "Harpoon go to file 2")
k("<A-k>", nav(3), "Harpoon go to file 3")
k("<A-l>", nav(4), "Harpoon go to file 4")
