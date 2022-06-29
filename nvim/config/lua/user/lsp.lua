-- Setup lspconfig.
local cmplsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmplsp_ok then
	return
end

local illu_ok, illuminate = pcall(require, "illuminate")
if not illu_ok then
	return
end

local status_ok, lspstatus = pcall(require, "lsp-status")
if not status_ok then
	return
end

local inst_ok, installer = pcall(require, "nvim-lsp-installer")
if not inst_ok then
	return
end

local ok, signature = pcall(require, "lsp_signature")
if not ok then
	return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then
	return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

signature.setup({
	floating_window = false,
	hint_prefix = "",
	bind = true,
	handler_opts = {
		border = "rounded",
	},
})

lspstatus.config({
	status_symbol = "⬤ ",
	current_function = true,
	diagnostics = false,
	kind_labels = lspkind.presets["default"],
})
lspstatus.register_progress()

local capabilities = vim.tbl_extend(
	"keep",
	cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()) or {},
	lspstatus.capabilities
)

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	illuminate.on_attach(client, bufnr)
	lspstatus.on_attach(client, bufnr)

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false -- 0.7 and earlier
		client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
		-- client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end

	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(150)
			augroup END
		]])
	end

	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
	end
end

installer.setup({
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "ﮊ",
		},
	},
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
	flags = {
		debounce_text_changes = 150,
	},
})

local schemas = {}
schemas["https://goreleaser.com/static/schema-pro.json"] = ".goreleaser.yaml"

lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			schemaStore = {
				url = "https://www.schemastore.org/api/json/catalog.json",
				enable = true,
			},
			schemas = schemas,
		},
	},
})

lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.terraformls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.tflint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.dockerls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	select_symbol = function(cursor_pos, symbol)
		-- fixes for lsp-status so it shows the function in its status bar
		if symbol.valueRange then
			local value_range = {
				["start"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[1]),
				},
				["end"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[2]),
				},
			}

			return require("lsp-status.util").in_range(cursor_pos, value_range)
		end
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.prosemd_lsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- organize imports
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function OrganizeImports(timeoutms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

local nulls_ok, null_ls = pcall(require, "null-ls")
if not nulls_ok then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
	capabilities = capabilities,
	on_attach = on_attach,
})
