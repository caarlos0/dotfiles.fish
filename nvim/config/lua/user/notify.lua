local notify = require("notify")
notify.setup({
  render = "minimal",
  stages = "fade",
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { focusable = false })
  end,
})
vim.notify = notify
