return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("user.colorscheme")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    priority = 999,
    opts = {
      default = true,
    },
  },
  {
    "rcarriga/nvim-notify",
    priority = 999,
    config = function()
      require("user.notify")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          "%=",
          {
            "filetype",
            icon_only = true,
            icon = { align = "right" },
          },
          {
            "filename",
            file_status = false,
            path = 1,
          },
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
