local present, custom_packer = pcall(require, 'packer_install')

if not present then
    return false
end

local packer = custom_packer.packer
local use = packer.use

return packer.startup(function()
    use({
        'wbthomason/packer.nvim',
        'lewis6991/impatient.nvim',
        'nathom/filetype.nvim',
        'nvim-lua/plenary.nvim',
    })

    -- theme
    -- tokyonight
    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.g.tokyonight_sidebars = { 'qf' }
            vim.cmd [[color tokyonight]]
        end,
    })
end)
