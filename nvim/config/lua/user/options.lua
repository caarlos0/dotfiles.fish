local options = {
	compatible = false,
	-- clipboard = "unnamedplus",
	-- cmdheight = 2,
	hidden = true,
	updatetime = 300, -- faster update times
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
	undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
	hlsearch = false,
	ignorecase = true,
	incsearch = true,
	ruler = true,
	wildmenu = true,
	autoread = true,
	-- syntax = true,
	completeopt = { "menu", "menuone", "noselect", "noinsert" },
	colorcolumn = "80",
	foldmethod = "indent",
	foldnestmax = 3,
	foldminlines = 10,
	foldlevelstart = 999,
	backspace = { "indent", "eol", "start" },
	spell = true,
	spelllang = { "en_us" },
	laststatus = 3,
	list = true,
	listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[
	set whichwrap+=<,>,[,],h,l
	set iskeyword+=-
	set formatoptions-=cro
]])
