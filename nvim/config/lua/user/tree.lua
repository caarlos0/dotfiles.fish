require("nvim-tree").setup()
vim.keymap.set("n", "<leader>tv", vim.cmd.NvimTreeToggle, { noremap = true, silent = true })
