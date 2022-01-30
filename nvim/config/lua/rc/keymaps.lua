local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal --
keymap('n', '<leader>ww', ':write<CR>', opts)
keymap('n', '<leader>qq', ':quit<CR>', opts)
keymap('n', '<leader>wq', ':wq<CR>', opts)

-- keep more or less in the same place when going next
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Insert --
-- in insert mode, adds new undo points after , . ! and ?.
keymap('i', ',', ',<c-g>u', opts)
keymap('i', '.', '.<c-g>u', opts)
keymap('i', '!', '!<c-g>u', opts)
keymap('i', '?', '?<c-g>u', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
