local M = {}

M.setup = function()
    local wk = require 'which-key'

    local mappings = {
        q = { ":q<cr>", "Quit" },
        Q = { ":wq<cr>", "Save & Quit" },
        w = { ":w<cr>", "Save" },
        x = { ":bdelete<cr>", "Close Buffer" },
        E = { ":e ~/.config/nvim/init.lua<cr>", "Edit Config File" },
    }

    local opts = { prefix = '<leader>' }
    wk.register(mappings, opts)
end

return M
