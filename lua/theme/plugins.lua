local M = {}

M.supported_themes = {
  'tokyonight',
}

M.init = function(use)
  local config = require('config')

  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      vim.g.tokyonight_sidebars = { 'qf' }
      vim.cmd([[color tokyonight]])
    end,
    disable = config.theme ~= 'tokyonight',
  })
end

return M
