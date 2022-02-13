local config = require('config')

-- set up lsp servers
require('lsp.providers')
require('lsp.diagnostics')

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = config.border,
  max_width = 80,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = config.border,
})
