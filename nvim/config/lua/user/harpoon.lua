r = require("user.remap").nnoremap
r("<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>")
r("<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
