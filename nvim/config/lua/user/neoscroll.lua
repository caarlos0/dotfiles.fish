local ok, scroll = pcall(require, "neoscroll")
if not ok then
	return
end

scroll.setup()
