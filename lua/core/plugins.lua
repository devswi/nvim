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
        'NTBBloodbath/galaxyline.nvim',
        branch = 'main',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.galaxyline')
        end,
        after = config.theme,
        disable = true,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.statusline')
        end,
        after = config.theme,
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
    }

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
          require('plugins.comments')
        end,
        event = 'BufWinEnter',
    }
end)
