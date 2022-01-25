local M = {}

M.install_plugins = function(use)
    -- telescope
    -- for fuzzy finding
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- better algorithm
                run = "make",
            },
        },
        config = function()
            require("config.tools.telescope")
        end
    }

    -- startuptime
    use {
        "dstein64/vim-startuptime",
    }

    -- which-key
    use {
        "folke/which-key.nvim",
        disable = true,
        opt = true,
        keys = " ",
        config = function()
            require('config.tools.which_key')
        end
    }
end

return M
