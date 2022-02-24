local map = require('utils').map

-- bufferline key mapping
map('n', '<TAB>', ':BufferLineCycleNext<CR>')
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')

-- better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- move current line / block with alt-j/k
map('i', '<A-j>', '<esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<esc>:m .-2<CR>==gi')
map('n', '<A-j>', '<esc>:m .+1<CR>')
map('n', '<A-k>', '<esc>:m .-2<CR>')

-- save
map('n', '<C-w>', ':w<CR>')
map('i', '<C-w>', '<esc>:w<CR>==gi')

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
  local url = string.match(vim.fn.expand('<cWORD>'), 'https?://[%w-_%.%?%.:/%+=&]+[^ >"\';`]*')
  if url ~= nil then
    if is_mac then
      vim.cmd(('!open "%s"'):format(url))
    else
      vim.cmd(('!xdg-open "%s"'):format(url))
    end
  else
    Logger:error('No https or http URI found in line.')
  end
end

map('n', 'gx', '<cmd>lua open_in_browser()<CR>')

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
