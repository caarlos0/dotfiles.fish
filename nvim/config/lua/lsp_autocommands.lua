local group = vim.api.nvim_create_augroup("LSP", { clear = true })

-- Organize imports.
--
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
--
---@param client table Client object
---@param bufnr number Buffer number
---@param timeoutms number timeout in ms
local organize_imports = function(client, bufnr, timeoutms)
  local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, timeoutms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

--- Checks if the given client is alive.
--
---@param client table Client object
---@return boolean
local is_alive = function(client)
  if client == nil then
    return false
  end
  if not client.initialized then
    return false
  end
  if client.is_stopped() then
    return false
  end
  return true
end

local M = {}

--- On attach adds all the autocommands we might need when attaching a lsp server to a buffer.
--
---@param client table Client object
---@param bufnr number
M.on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider and client.name ~= "lua_ls" then
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          filter = function(cli)
            return cli.name == client.name
          end,
        })
      end,
      group = group,
    })
  end

  -- If the organizeImports codeAction runs for lua files, depending on
  -- where the cursor is, it'll reorder the args and break stuff.
  -- This took me way too long to figure out.
  if client.server_capabilities.codeActionProvider and vim.bo.filetype ~= "lua" and client.name ~= "null-ls" then
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      buffer = bufnr,
      callback = function()
        organize_imports(client, bufnr, 1500)
      end,
      group = group,
    })
  end

  if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = bufnr,
      callback = function()
        if is_alive(client) then
          vim.lsp.codelens.refresh()
        end
      end,
      group = group,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      buffer = bufnr,
      callback = function()
        if is_alive(client) then
          vim.lsp.codelens.clear()
        end
      end,
      group = group,
    })
  end

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = function()
        if is_alive(client) then
          vim.lsp.buf.document_highlight()
        end
      end,
      group = group,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
      buffer = bufnr,
      callback = function()
        if is_alive(client) then
          vim.lsp.buf.clear_references()
        end
      end,
      group = group,
    })
  end
end

return M
