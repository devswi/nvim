local M = {}

M.install_plugins = function(use)
    -- lsp installer
    use {
        'williamboman/nvim-lsp-installer',
        requires = {
            'neovim/nvim-lspconfig',
            'ray-x/lsp_signature.nvim',
            'jose-elias-alvarez/nvim-lsp-ts-utils',
        },
        config = function()
            require('config.lsp')
        end,
        after = 'nvim-cmp',
        event = 'BufEnter',
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('config.lsp.cmp')
        end,
        requires = {
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-path' },
            { 'onsails/lspkind-nvim' },
            { 'ray-x/lsp_signature.nvim' },
            { 'hrsh7th/cmp-nvim-lsp' },
        },
    }
end

return M
