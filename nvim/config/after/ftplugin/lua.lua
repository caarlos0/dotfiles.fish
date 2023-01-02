-- Options to add `gf` functionality inside `.lua` files.
vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"

for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
  vim.opt_local.path:append(path .. "/lua")
end

vim.opt_local.suffixesadd:prepend(".lua")
