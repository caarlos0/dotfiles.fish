local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable ={ "yaml" },
  },
  ensure_installed = "maintained",
  autopairs = {
    enable = true,
  },
}
