local map = require('utils').map

-- nvim-tree key mapping
require('plugins.nvimtree.mappings')

-- bufferline key mapping
map('n', '<TAB>', ':BufferLineCycleNext<CR>')
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
map('n', '<C-x>', ':BufferLinePickClose<CR>')

-- gx mapping
function _G.open_in_browser()
  local Logger = require('utils.logger')
  local url = string.match(vim.fn.expand('<cWORD>'), '[https|http]+://[^ >"\',;]*')
  if url ~= nil then
    if vim.fn.has('mac') == 1 then
      vim.cmd(('!open %s'):format(url))
    elseif vim.fn.has('unix') == 1 then
      vim.cmd(('!xdg-open %s'):format(url))
    else
      Logger:error('gx is not supoorted on this OS!')
    end
  else
    Logger:error('No https or http URI found in line.')
  end
end

map('n', 'gx', '<cmd>lua open_in_browser()<cr>')
