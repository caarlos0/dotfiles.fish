vim.api.nvim_set_var("test#strategy", "neovim")
vim.api.nvim_set_var("test#neovim#term_position", "vert")

local r = require("user.remap").nnoremap
r("<leader>ttn", ":TestNearest -v<CR>g")
r("<leader>ttf", ":TestFile -v<CR>g")
r("<leader>tts", ":TestSuite -v<CR>g")
r("<leader>ttl", ":TestLast -v<CR>g")
r("<leader>ttv", ":TestVisit -v<CR>g")
