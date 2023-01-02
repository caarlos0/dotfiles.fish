local colors = require("catppuccin.palettes").get_palette()
require("catppuccin").setup({
  flavour = "mocha",
  color_overrides = {
    mocha = {
      base = "#000000",
    },
  },
  custom_highlights = {
    Comment = { fg = colors.overlay1 },
    LineNr = { fg = colors.overlay1 },
  },
  integrations = {
    cmp = true,
    dap = {
      enabled = true,
      enable_ui = true,
    },
    fidget = true,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    markdown = true,
    mason = true,
    native_lsp = {
      enabled = true,
    },
    neogit = true,
    neotree = true,
    notify = true,
    nvimtree = true,
    symbols_outline = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    which_key = true,
  },
})

vim.cmd([[ colorscheme catppuccin ]])
