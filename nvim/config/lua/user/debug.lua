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
n("<F5>", dap.continue)
n("<F3>", dap.step_over)
n("<F2>", dap.step_into)
n("<F12>", dap.step_out)
n("<leader>b", dap.toggle_breakpoint)
-- n("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- n("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
n("<leader>dr", dap.repl.open)
n("<leader>dt", gdap.debug_test)
