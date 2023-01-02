vim.keymap.set("n", "<leader>jf", "<cmd>%!jq<cr>", { noremap = true, silent = true, desc = "Format with jq" })
vim.keymap.set("n", "<leader>jm", "<cmd>%!jq -c<cr>", { noremap = true, silent = true, desc = "Minify with jq" })
