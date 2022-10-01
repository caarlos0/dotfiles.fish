local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspstatus = require("lsp-status")
lspstatus.config({
	status_symbol = "⬤ ",
	current_function = true,
	diagnostics = false,
	kind_labels = require("lspkind").presets["default"],
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

	lspstatus.on_attach(client, bufnr)

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
	buf_set_keymap("n", "<C-h>", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)

	if client.server_capabilities.documentFormattingProvider and client.name ~= "sumneko_lua" then
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			callback = function()
				if vim.lsp.buf.server_ready() then
					vim.lsp.buf.format()
				end
			end,
			group = vim.api.nvim_create_augroup("LSPFormat", { clear = true }),
		})
	end

	-- If the organizeImports codeAction runs for lua files, depending on
	-- where the cursor is, it'll reorder the args and break stuff.
	-- This took me way too long to figure out.
	if client.name ~= "null-ls" and client.name ~= "sumneko_lua" then
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = "<buffer>",
			callback = function()
				if vim.lsp.buf.server_ready() then
					OrganizeImports(150)
				end
			end,
			group = vim.api.nvim_create_augroup("LSPOrganizeImports", { clear = true }),
		})
	end

	if client.server_capabilities.documentHighlightProvider then
		local group = vim.api.nvim_create_augroup("LSPHighlight", { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			pattern = "<buffer>",
			callback = function()
				if vim.lsp.buf.server_ready() then
					vim.lsp.buf.document_highlight()
				end
			end,
			group = group,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved" }, {
			pattern = "<buffer>",
			callback = function()
				if vim.lsp.buf.server_ready() then
					vim.lsp.buf.clear_references()
				end
			end,
			group = group,
		})
	end
end

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
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

lspconfig.golangci_lint_ls.setup({
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
				globals = { "vim", "require", "pcall", "pairs" },
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
	local clients = vim.lsp.buf_get_clients()
	for _, client in pairs(clients) do
		local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
		params.context = { only = { "source.organizeImports" } }

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
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
end

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

-- setup diagnostics
vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		if vim.lsp.buf.server_ready() then
			vim.diagnostic.open_float()
		end
	end,
	group = vim.api.nvim_create_augroup("LSPDiagnosticsHold", { clear = true }),
})

-- set up LSP signs
for type, icon in pairs({
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
