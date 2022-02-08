r = require("user.remap").nnoremap
r("<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>")
r("<C-e>", "<cmd>lua require('harpoon.ui').toggle()<CR>")
