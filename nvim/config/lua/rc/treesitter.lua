require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable ={},
  },
  ensure_installed = {
    "bash",
    "css",
    "fish",
    "go",
    "html",
    "json",
    "lua",
    -- "terraform",
    "toml",
    "vim",
    "yaml",
  }
}
