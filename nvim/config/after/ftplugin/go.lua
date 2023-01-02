vim.opt_local.formatoptions:append("jno")

local function restart(name)
  local configs = require("lspconfig.configs")
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in
    ipairs(vim.lsp.get_active_clients({
      bufnr = bufnr,
      name = name,
    }))
  do
    vim.notify("Restarting " .. client.name .. "...")
    client.stop()
    vim.defer_fn(function()
      configs[client.name].launch()
    end, 500)
  end
end

local function tidy()
  vim.notify("Running `go mod tidy`...")
  local uv = vim.loop
  local stdout = uv.new_pipe(false)
  local stderr = uv.new_pipe(false)
  local function on_read(err, _)
    assert(not err, err)
  end

  local function on_error(err, data)
    assert(not err, err)
    if data then
      -- Just print errors, in case I notice in vim and want to debug
      print(data)
    end
  end

  local handle
  handle, _ = uv.spawn(
    "go",
    {
      args = { "mod", "tidy" },
      stdio = { nil, stdout, stderr },
      cwd = vim.fn.expand("%:h"),
    },
    vim.schedule_wrap(function()
      stdout:read_stop()
      stderr:read_stop()
      stdout:close()
      stderr:close()
      handle:close()
      vim.schedule(function()
        for _, name in ipairs({ "gopls", "golangci_lint_ls" }) do
          restart(name)
        end
      end)
    end)
  )
  uv.read_start(stdout, on_read)
  uv.read_start(stderr, on_error)
  uv.run("once")
end

vim.api.nvim_create_user_command("GoModTidy", tidy, vim.tbl_extend("force", { desc = "go mod tidy" }, {}))

vim.keymap.set("n", "<leader>gmt", ":GoModTidy<CR>", { noremap = true, silent = true, desc = "Run go mod tidy" })
