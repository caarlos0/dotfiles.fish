local ok, autosave = pcall(require, "autosave")
if not ok then
	return
end

autosave.setup({
	events = { "FocusLost" },
	write_all_buffers = true,
})
