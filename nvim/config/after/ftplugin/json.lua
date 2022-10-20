local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>jf", "<cmd>%!jq<cr>", opts)
keymap("n", "<leader>jm", "<cmd>%!jq -c<cr>", opts)
