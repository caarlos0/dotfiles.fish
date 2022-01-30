local ok, bufline = pcall(require, "bufferline")
if not ok then
	return
end

bufline.setup({})
