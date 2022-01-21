local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/pakcer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    git = {
        clone_timeout = 300,
        subcommands = {
            fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress"
        },
    },
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- load plugins
    for _, module_name in ipairs({ 'ui', 'tools' }) do
        local m = require("plugins." .. module_name)
        m.install_plugins(use)
    end

    use {
        'sindrets/diffview.nvim',
        disable = true,
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = "require('config.diffview')",
        -- cmd = {'DiffviewOpen'},
        opt = true
    }
    --
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.treesitter").setup()
        end
    }

    -- LSP
    use {
        "neovim/nvim-lspconfig", event = "BufRead"
    }

    use {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("lsp")
        end,
        after = { "nvim-lspconfig" }
    }

    -- auto tag
    use { 'windwp/nvim-ts-autotag' }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require("config.autopairs").setup()
        end
    }

    -- highlight brackets
    use { 'p00f/nvim-ts-rainbow' }

    -- colorizer
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("config.colorizer")
        end
    }


    -- Comment
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("config.comment")
        end,
        keys = { 'gcc', 'gc', 'gl' },
    }

    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        ft = {
            "typescript", "typescriptreact"
        }
    }

    -- luasnips + cmp
    use {
        "rafamadriz/friendly-snippets",
    }

    use {
        'L3MON4D3/LuaSnip',
        wants = "friendly-snippets",
        after = "friendly-snippets",
        config = 'require("config.luasnip")',
    }
    use {
        'hrsh7th/nvim-cmp',
        config = "require('config.cmp')",
        after = 'LuaSnip',
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        disable = true,
        config = "require('lsp.null-ls')",
        require = { "nvim-lua/plenary.nvim" },
        after = 'LuaSnip'
    }

    use {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip",
    }

    use {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp_luasnip",
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua",
    }

    use {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lsp",
    }

    use {
        "hrsh7th/cmp-path",
        after = "cmp-buffer",
    }

    -- Automatically set up your configuration after cloning packer.nvim

    if packer_bootstrap then
        require('packer').sync()
    end
end)
