return {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>smb", vim.cmd.SymbolsOutline, noremap = true, silent = true, desc = "Symbols Outline" },
    },
    config = { width = 25 },
  },
  {
    "williamboman/mason.nvim",
    event = "BufEnter",
    dependencies = {
      -- lsp
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",

      -- cmp
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",

      -- cmp x lsp
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",

      -- snip x cmp
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",

      -- autopairs (x cmp)
      "windwp/nvim-autopairs",

      -- hints
      "simrat39/inlay-hints.nvim",

      -- working with neovim config/plugins
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()
      require("luasnip").setup({
        -- see: https://github.com/L3MON4D3/LuaSnip/issues/525
        region_check_events = "InsertEnter",
        delete_check_events = "InsertLeave",
      })
      require("luasnip.loaders.from_vscode").lazy_load()
      require("nvim-autopairs").setup()
      require("user.lsp")
      require("user.cmp")
    end,
  },
}
