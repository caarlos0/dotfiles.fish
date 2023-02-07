return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      -- "nvim-treesitter/playground",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-autopairs",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>", -- maps in normal mode to init the node/scope selection with ctrl+space
            node_incremental = "<C-space>", -- increment to the upper named parent
            node_decremental = "<bs>", -- decrement to the previous node
            scope_incremental = "<noop>", -- increment to the upper scope (as defined in locals.scm)
          },
        },
        auto_install = false,
        ensure_installed = {
          "bash",
          "cpp",
          "css",
          "diff",
          "dockerfile",
          "fish",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore", -- will require tree-sittter-cli
          "go",
          "gomod",
          "gowork",
          "graphql",
          "hcl",
          "help",
          "html",
          "http",
          "javascript",
          "jq",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "query",
          "regex",
          "rust",
          "scss",
          "sql", -- will require tree-sittter-cli
          "terraform",
          "toml",
          "vhs",
          "vim",
          "yaml",
          "zig",
        },
        textobjects = {
          enable = true,
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]p"] = "@parameter.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]P"] = "@parameter.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[p"] = "@parameter.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[P"] = "@parameter.outer",
              ["[C"] = "@class.outer",
            },
          },
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",

              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",

              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",

              ["av"] = "@variable.outer",
              ["iv"] = "@variable.inner",
            },
          },
        },
      })
    end,
  },
}
