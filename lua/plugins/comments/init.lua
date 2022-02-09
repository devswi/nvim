local config = require('config')
local utils = require('utils')

require('Comment').setup({
  padding = true,
  ignore = nil,
  mappings = {
    ---operator-pending mapping
      ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
      basic = true,
      ---extra mapping
      ---Includes `gco`, `gcO`, `gcA`
      extra = true,
      ---extended mapping
      ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = false,
  },
  toggler = {
    ---line-comment keymap
    line = 'gcc',
    ---block-comment keymap
    block = 'gbc',
  },
  ---LHS of operator-pending mapping in NORMAL + VISUAL mode
  ---@type table
  opleader = {
      ---line-comment keymap
      line = 'gc',
      ---block-comment keymap
      block = 'gb',
  },
  pre_hook = function(ctx)
    local U = require('Comment.utils')
    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring({
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    })
  end,
})
