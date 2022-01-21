local M = {}

M.install_plugins = function(use)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        after = "coc.nvim",
        config = function()
            require("config.editor.treesitter")
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        opt = true,
        after = "nvim-treesitter",
    }

    local autotag_ft = {
        "html", "xml", "javascript", "typescriptreact", "javascriptreact", "vue"
    }
    use {
        "windwp/nvim-ts-autotag",
        opt = true,
        ft = autotag_ft,
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = autotag_ft,
            })
        end
    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    }

    -- highlight brackets
    use {
        "p00f/nvim-ts-rainbow",
        opt = true,
        after = "nvim-treesitter",
        event = "BufRead",
    }

    -- colorizer
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("config.editor.colorizer")
        end,
    }

    -- Comment
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("config.editor.comment")
        end,
        keys = { 'gcc', 'gc', 'gl' },
    }

    -- comment for javascript typescript react
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        ft = {
            "typescript", "typescriptreact"
        },
        opt = true,
        after = "nvim-treesitter"
    }
end

return M
