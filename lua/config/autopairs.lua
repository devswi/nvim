local M = {}

M.setup = function()
    local autopairs = require 'nvim-autopairs'

    autopairs.setup {
        check_ts = true,
    }
end

return M
