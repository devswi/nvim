local M = {}

M.install_plugins = function(use)
    use {
        "kyazdani42/nvim-web-devicons",
        opt = false,
    }

    use "nvim-lua/plenary.nvim"

    -- color scheme
    use {
        "folke/tokyonight.nvim",
        config = function()
            require("config.ui.tokyonight")
        end
    }
    use {
        "Mofiqul/vscode.nvim",
        disable = true,
    }

    -- lualine
    use {
        "nvim-lualine/lualine.nvim",
        require = "nvim-web-devicons",
        config = function()
            require("config.ui.statusline")
        end
    }

    -- dashboard
    -- disabled!!!
    use {
        "glepnir/dashboard-nvim",
        opt = true,
        event = "BufWinEnter",
        disable = true,
    }

    -- Nvim-Tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("config.ui.nvimtree").setup()
        end
    }

    -- Add git related info in the signs columns and popups
    use {
        'lewis6991/gitsigns.nvim',
        opt = true,
        event = { "BufRead", "BufNewFile" },
        requires = { "nvim-lua/plenary.nvim", opt = true },
        config = function()
            require("config.ui.gitsigns")
        end,
    }

    -- highlighting indent
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("config.ui.blankline")
        end
    }

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        require = { "nvim-web-devicons", opt = true },
        opt = true,
        event = "BufRead",
        config = function()
            require('config.ui.buffer_line')
        end
    }
end

return M
