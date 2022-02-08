local map = require('utils').map

-- nvim-tree key mapping
require('plugins.nvimtree.mappings')

-- bufferline key mapping
map('n', '<TAB>', ':BufferLineCycleNext<CR>')
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
map('n', '<C-x>', ':BufferLinePickClose<CR>')

-- leader
--
