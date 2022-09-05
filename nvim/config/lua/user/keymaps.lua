local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- disable Ex mode, I always enter in it by mistake
keymap("n", "Q", "<Nop>", opts)

-- quicklists
keymap("n", "<leader>co", ":copen<CR>", opts)
keymap("n", "<leader>cc", ":cclose<CR>", opts)

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- save and quit
keymap("n", "<leader>w", ":write<CR>", opts)
keymap("n", "<leader>q", ":bdelete<CR>", opts)

-- keep more or less in the same place when going next
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- keymap("n", "Q", "q", opts)
-- disable macros, I never use them
keymap("n", "q", "<Nop>", opts)

-- Insert empty blank line above/bellow
-- keymap("n", "[<Space>", "m`o<Esc>``", opts)
-- keymap("n", "]<Space>", "m`O<Esc>``", opts)

-- Insert --
-- in insert mode, adds new undo points after , . ! and ?.
keymap("i", "-", "-<c-g>u", opts)
keymap("i", "_", "_<c-g>u", opts)
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- system clipboard integration
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>Y", '"+Y', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
