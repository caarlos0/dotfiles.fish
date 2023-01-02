vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require("auto-session").setup({
  log_level = "error",
  auto_save_enabled = true,
  auto_restore_enabled = true,
  pre_save_cmds = {
    -- prevents cmdline spanning almost the entire window height on restore.
    -- this will close all float windows before saving.
    function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then
          vim.api.nvim_win_close(win, false)
        end
      end
    end,
  },
})
