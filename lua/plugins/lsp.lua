local M = {}

M.install_plugins = function(use)
    -- lsp installer
    use {
        'williamboman/nvim-lsp-installer',
        run = function()
            require('config.lsp.installer')
        end,
        rocks = { 'promise-lua' },
        requires = {
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('config.lsp')
        end
    }

    -- LSP
    --
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('config.lsp.cmp')
        end,
        requires = {
            "rafamadriz/friendly-snippets",
            {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                config = function()
                    require('config.lsp.luasnip')
                end
            }
        },
    }
end

return M
