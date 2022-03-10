local ok, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if not ok then
	return
end

luasnip.load()
