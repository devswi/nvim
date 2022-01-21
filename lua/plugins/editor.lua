local M = {}

M.install_plugins = function(use)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.editor.treesitter")
        end
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
        "p00f/nvim-ts-rainbow"
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

    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        ft = {
            "typescript", "typescriptreact"
        }
    }
end

return M
