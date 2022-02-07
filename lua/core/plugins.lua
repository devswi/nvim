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
    }
end)
