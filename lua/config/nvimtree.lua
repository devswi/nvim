local M = {}

M.setup = function()
    require("nvim-tree").setup {
   }

    local keymappings = require "mappings"

    keymappings.load({
        normal_mode = {
            ["<C-n>"] = ":NvimTreeToggle <CR>",
            ["<leader>e"] = ":NvimTreeFocus <CR>",
        }
    })

end

return M
