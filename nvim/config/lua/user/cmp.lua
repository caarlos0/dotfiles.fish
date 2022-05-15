local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then
	return
end
lspkind.init()
lspkind.symbol_map["spell"] = ""

local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
	return
end

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		-- ["<C-k>"] = cmp.mapping.select_prev_item(),
		-- ["<C-j>"] = cmp.mapping.select_next_item(),
		-- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		-- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		-- ["<C-e>"] = cmp.mapping({
		-- 	i = cmp.mapping.abort(),
		-- 	c = cmp.mapping.close(),
		-- }),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif check_backspace() then
				fallback()
			else
				cmp.complete()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol",
			before = function(entry, item)
				if entry.source.name == "spell" then
					item.kind = entry.source.name
					item.priority = 50
				end
				return item
			end,
		}),
	},
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
	}, {
		{ name = "path" },
		{ name = "buffer" },
	}, {
		{ name = "spell" },
		{ name = "calc" },
		{ name = "emoji" },
	}),
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
})

-- autopairs cmp
local status_ok, autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_ok then
	return
end

cmp.event:on("confirm_done", autopairs.on_confirm_done({ map_char = { tex = "" } }))
