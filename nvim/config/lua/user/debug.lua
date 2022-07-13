local dap = require("dap")
local dapui = require("dapui")
local gdap = require("dap-go")
local vtdap = require("nvim-dap-virtual-text")

gdap.setup({})
dapui.setup({})
vtdap.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local n = require("user.remap").nnoremap
n("<F5>", ":lua require'dap'.continue()<CR>")
n("<F3>", ":lua require'dap'.step_over()<CR>")
n("<F2>", ":lua require'dap'.step_into()<CR>")
n("<F12>", ":lua require'dap'.step_out()<CR>")
n("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
n("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
n("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
n("<leader>dr", ":lua require'dap'.repl.open()<CR>")
n("<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
