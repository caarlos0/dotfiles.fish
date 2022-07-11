local ok, autosession = pcall("auto-session", require)
if not ok then
	return
end

autosession.setup({
	auto_save_enabled = true,
	auto_restore_enables = true,
})
