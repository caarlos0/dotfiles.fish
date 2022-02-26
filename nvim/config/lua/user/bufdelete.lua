local n = require("user.remap").nnoremap
n("<leader>q", "<cmd>lua require('bufdelete').bufdelete(0, false)<CR>")
