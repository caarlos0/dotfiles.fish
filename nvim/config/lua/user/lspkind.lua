local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

lspkind.init({
	mode = "symbol_text",
	symbol_map = {
		Class = "ﴯ",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "ﰠ",
		File = "",
		Folder = "",
		Function = "",
		Interface = "",
		Keyword = "",
		Method = "",
		Module = "",
		Operator = "",
		Property = "ﰠ",
		Reference = "",
		Snippet = "",
		Struct = "פּ",
		Text = "",
		TypeParameter = "",
		Unit = "塞",
		Value = "",
		Variable = "",
	},
})
