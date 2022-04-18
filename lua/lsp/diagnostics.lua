local icons = require('theme.icons')
local config = require('config')

-- set up LSP signs
local signs = {
  Error = icons.error .. ' ',
  Warn = icons.warn .. ' ',
  Hint = icons.hint .. ' ',
  Info = icons.info .. ' ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = 'DiagnosticDefault' .. type })
end

-- set up vim.diagnostics
-- vim.diagnostic.config opts
vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = config.border,
    focusable = false,
    header = { icons.debug .. ' Diagnostics:', 'Normal' },
    source = 'always',
  },
  virtual_text = {
    prefix = '●',
    spacing = 4,
    source = 'always',
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
})
