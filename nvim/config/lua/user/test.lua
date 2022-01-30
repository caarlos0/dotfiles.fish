local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>ttn", ":TestNearest<CR>", opts)
keymap("n", "<leader>ttf", ":TestFile<CR>", opts)
keymap("n", "<leader>tts", ":TestSuite<CR>", opts)
keymap("n", "<leader>ttl", ":TestLast<CR>", opts)
keymap("n", "<leader>ttv", ":TestVisit<CR>", opts)
