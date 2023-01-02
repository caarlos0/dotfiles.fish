return {
  {
    "catppuccin/nvim",
    as = "catppuccin",
    priority = 1000,
    config = function()
      require("user.colorscheme")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    priority = 999,
    config = {
      default = true,
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    config = {
      options = {
        diagnostics = "nvim_lsp",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    config = {
      options = {
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            file_status = false,
            path = 1,
          },
        },
        lualine_x = {
          "encoding",
          "filetype",
        },
      },
    },
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("user.autosession")
    end,
  },
}
