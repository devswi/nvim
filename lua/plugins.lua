local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/pakcer/start/packer.nvim"
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

    use "nvim-lua/plenary.nvim"

    -- color scheme
    use {
        "shaunsingh/hl.c.nvim",
        disable = true,
        config = function()
            local colors = require("colors")
            colors.set("nord")
        end,
    }

    -- web devicons
    use {
        "kyazdani42/nvim-web-devicons",
    }

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require('config.bufferline')
        end
    }

    -- statusline
    use {
        "nvim-lualine/lualine.nvim",
        after = "nvim-web-devicons",
        config = function()
            require("config.statusline")
        end
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.treesitter").setup()
        end
    }

    -- gitsigns
    use {}

    -- telescope
    -- for fuzzy finding
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
        },
        config = function()
            local telescope = require "config/telescope"
            telescope.setup()
        end
    }

    -- Nvim-Tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("config.nvimtree").setup()
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

    -- which-key
    use {
        "folke/which-key.nvim",
        -- disable which-key plugin
        disable = true,
        config = function()
            require('config.which-key').setup()
        end
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

    -- highlighting indent
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.blankline")
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
