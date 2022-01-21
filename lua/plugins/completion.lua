local M = {}

M.install_plugins = function(use)
    use {
        "neoclide/coc.nvim",
        opt = true,
        event = "BufRead",
        branch = "release",
        require = {
            { "tokyonight" },
        },
        config = function()
            require("config.completion.coc")
        end
    }
end

return M
