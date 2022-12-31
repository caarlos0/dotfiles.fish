vim.api.nvim_set_var("test#strategy", "neovim")
vim.api.nvim_set_var("test#neovim#term_position", "vert")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ttn", ":TestNearest -v<CR>g", opts)
vim.keymap.set("n", "<leader>ttf", ":TestFile -v<CR>g", opts)
vim.keymap.set("n", "<leader>tts", ":TestSuite -v<CR>g", opts)
vim.keymap.set("n", "<leader>ttl", ":TestLast -v<CR>g", opts)
vim.keymap.set("n", "<leader>ttv", ":TestVisit -v<CR>g", opts)
