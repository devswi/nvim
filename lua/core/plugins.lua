local present, custom_packer = pcall(require, 'packer_install')

if not present then
    return false
end

local packer = custom_packer.packer
local use = packer.use

local config = require('config')

return packer.startup(function()
    use({
        'wbthomason/packer.nvim',
        'lewis6991/impatient.nvim',
        'nathom/filetype.nvim',
        'nvim-lua/plenary.nvim',
    })

    -- theme
    require('theme.plugins').init(use)

    use({
        'rcarriga/nvim-notify',
        config = function()
            require('plugins.notify')
        end,
        after = config.theme,
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.statusline')
        end,
        after = config.theme,
    }

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        require = { "nvim-web-devicons", opt = true },
        opt = true,
        event = "BufRead",
        config = function()
            require('plugins.buffer_line')
        end
    }

    -- file explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('plugins.nvimtree')
        end,
        opt = true,
        cmd = {
            'NvimTreeClipboard',
            'NvimTreeClose',
            'NvimTreeFindFile',
            'NvimTreeOpen',
            'NvimTreeRefresh',
            'NvimTreeToggle',
        }
    }

    -- git column signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        opt = true,
        event = 'BufRead',
        config = function()
            require('plugins.gitsigns')
        end,
    }

    -- lang/syntax stuff
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
          'windwp/nvim-ts-autotag',
          'JoosepAlviste/nvim-ts-context-commentstring',
          'nvim-treesitter/nvim-treesitter-refactor',
        },
        run = ':TSUpdate',
        config = function()
          require('plugins.treesitter')
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        opt = true,
        after = "nvim-treesitter",
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
            require('plugins.colorizer')
        end,
        opt = true,
        event = "BufRead",
    }

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
          require('plugins.comments')
        end,
        event = 'BufWinEnter',
    }

    -- highlighting indent
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.blankline")
        end,
        opt = true,
        event = "BufRead",
    }

    -- tools

    -- startuptime
    use {
        "dstein64/vim-startuptime",
        opt = true,
        cmd = "Startuptime"
    }

    -- telescope
    -- for fuzzy finding
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
        },
        config = function()
            require('plugins.telescope.mappings').init()
            require('plugins.telescope')
        end,
        event = 'BufWinEnter',
    }
end)
