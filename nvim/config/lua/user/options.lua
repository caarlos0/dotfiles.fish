local options = {
  compatible = false,
  -- clipboard = "unnamedplus",
  hidden = true,
  updatetime = 1000, -- faster update times, default 4000
  mouse = "a",
  inccommand = "split",
  splitbelow = true,
  splitright = true,
  wrap = false,
  textwidth = 0,
  expandtab = true,
  smartindent = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  signcolumn = "yes",
  scrolloff = 10,
  sidescrolloff = 10,
  number = true,
  relativenumber = true,
  swapfile = false,
  backup = false,
  undofile = true,
  undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir",
  hlsearch = false,
  ignorecase = true,
  incsearch = true,
  ruler = true,
  wildmenu = true,
  autoread = true,
  completeopt = { "menu", "menuone", "noselect" },
  colorcolumn = "80",
  backspace = { "indent", "eol", "start" },
  spell = true,
  spelllang = { "en_us" },
  laststatus = 3,
  cursorline = true,
  list = false,
  listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣",
  grepprg = "rg --vimgrep --smart-case --follow",
  background = "dark",
  termguicolors = true,
}

vim.opt.shortmess:append("c")
-- vim.opt.nrformats:append("alpha") -- most of the time I dont want this

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.filetype.add({
  extension = {
    tape = "vhs",
  },
})

vim.cmd([[
iabbrev Goreleaser GoReleaser
iabbrev gorelesaer goreleaser
iabbrev carlos0 caarlos0
iabbrev descriptoin description
iabbrev fucn func
iabbrev sicne since
]])
