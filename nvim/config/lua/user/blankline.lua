local ok, blankline = pcall(require, "indent_blankline")
if not ok then
	return
end

blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
