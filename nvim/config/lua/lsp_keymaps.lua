local M = {}

--- Add a normal keymap.
---@param lhs string Keymap
---@param rhs function Action
---@param bufnr number Buffer number
local keymap = function(lhs, rhs, bufnr)
  vim.keymap.set("n", lhs, rhs, {
    noremap = true,
    silent = true,
    buffer = bufnr,
  })
end

--- On attach for key maps.
---@param bufnr number Buffer number
M.on_attach = function(bufnr)
  local builtin = require("telescope.builtin")
  keymap("gd", builtin.lsp_definitions, bufnr)
  keymap("gr", builtin.lsp_references, bufnr)
  keymap("<C-j>", builtin.lsp_document_symbols, bufnr)
  keymap("<C-h>", builtin.lsp_dynamic_workspace_symbols, bufnr)
  keymap("<C-k>", vim.lsp.buf.signature_help, bufnr)
  keymap("gi", builtin.lsp_implementations, bufnr)
  keymap("gD", vim.lsp.buf.declaration, bufnr)
  keymap("K", vim.lsp.buf.hover, bufnr)
  keymap("<leader>D", builtin.lsp_type_definitions, bufnr)
  keymap("<leader>cl", vim.lsp.codelens.run, bufnr)
  keymap("<leader>rn", vim.lsp.buf.rename, bufnr)
  keymap("<leader>ca", vim.lsp.buf.code_action, bufnr)
  keymap("<leader>gl", vim.diagnostic.open_float, bufnr)
  keymap("<leader>lr", vim.cmd.LspRestart, bufnr)
  keymap("[d", function()
    vim.diagnostic.goto_prev({ float = false })
    vim.cmd("norm zz")
  end, bufnr)
  keymap("]d", function()
    vim.diagnostic.goto_next({ float = false })
    vim.cmd("norm zz")
  end, bufnr)
end

return M
