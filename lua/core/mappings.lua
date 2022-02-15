local map = require('utils').map

-- nvim-tree key mapping
require('plugins.nvimtree.mappings')

-- bufferline key mapping
map('n', '<TAB>', ':BufferLineCycleNext<CR>')
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
-- close current buffer
map('n', '<C-x>', ':bdelete!<cr>')
-- pick buffer close
map('n', '<leader>x', ':BufferLinePickClose<CR>')

-- Misc
map('n', '<cr>', ':noh<cr><cr>')

-- better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- move current line / block with alt-j/k
map('i', '<A-j>', '<esc>:m .+1<cr>==gi')
map('i', '<A-k>', '<esc>:m .-2<cr>==gi')
map('n', '<A-j>', '<esc>:m .+1<cr>==')
map('n', '<A-k>', '<esc>:m .-2<cr>==')

-- save
map('n', '<C-s>', ':w<cr>')
map('i', '<C-s>', '<esc> :w<cr>')

-- Keeping visual mode indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Movement in Insert Mode
map('i', '<C-b>', '<Left>')
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')
map('i', '<C-f>', '<Right>')

local is_mac = vim.fn.has('macunix') == 1

-- Open links under cursor in browser with gx
function _G.open_in_browser()
  local Logger = require('utils.logger')
  local url = string.match(vim.fn.expand('<cWORD>'), '[(http|ftp)s?|file]+://[^ >"\',;`]*')
  if url ~= nil then
    if vim.fn.has('macunix') == 1 then
      vim.cmd(('!open %s'):format(url))
    else
      vim.cmd(('!xdg-open %s'):format(url))
    end
  else
    Logger:error('No https or http URI found in line.')
  end
end

map('n', 'gx', '<cmd>lua open_in_browser()<cr>')

if is_mac then
  map('n', '<A-Up>', ':resize -2<CR>')
  map('n', '<A-Down>', ':resize +2<CR>')
  map('n', '<A-Right>', ':vertical resize -2<CR>')
  map('n', '<A-Left>', ':vertical resize +2<CR>')
else
  map('n', '<C-Up>', ':resize -2<CR>')
  map('n', '<C-Down>', ':resize +2<CR>')
  map('n', '<C-Right>', ':vertical resize -2<CR>')
  map('n', '<C-Left>', ':vertical resize +2<CR>')
end
