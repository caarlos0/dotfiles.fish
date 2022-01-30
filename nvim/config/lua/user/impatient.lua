local ok, impatient = pcall(require, "impatient")
if not ok then
	return
end

impatient.enable_profile()
