local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>jf", "<cmd>%!jq<cr>", opts)
vim.keymap.set("n", "<leader>jm", "<cmd>%!jq -c<cr>", opts)
