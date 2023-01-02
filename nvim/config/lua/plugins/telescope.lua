return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("user.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-github.nvim",
      "ThePrimeagen/harpoon",
    },
  },
}
