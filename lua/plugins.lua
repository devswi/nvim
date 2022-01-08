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
return packer.startup(function()
    local use = use

    use "wbthomason/packer.nvim"

    -- color scheme
    use {
        "shaunsingh/nord.nvim",
        config = function()
            require("colors")
        end,
    }

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.bufferline").setup()
        end
    }

    -- statusline
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("config.statusline").setup()
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

    -- telescope
    -- for fuzzy finding
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {'nvim-lua/plenary.nvim'} },
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

    -- which-key
    use {
        "folke/which-key.nvim",
        disable = true,
        config = function()
            require("config.which-key").setup()
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

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
