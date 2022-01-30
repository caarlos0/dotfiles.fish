local options = {
	compatible = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	hidden = true,
	updatetime = 300,  -- faster update times
	mouse = "a",
	inccommand = "split",
	wrap = false,
	textwidth = 0,
	expandtab= true,
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
	undodir = "~/.config/nvim/undodir",
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	ruler = true,
	wildmenu = true,
	autoread = true,
	-- syntax = true,
	completeopt = { "menuone", "noselect" },
	colorcolumn = "80",
	foldmethod = "indent",
	foldnestmax = 3,
	foldminlines = 40,
	foldlevelstart = 999,
	backspace = { "indent", "eol", "start" },
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
