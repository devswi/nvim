local M = {}

-- Mappings.
function M.init(_, bufnr)
  local buf_map = require('utils').buf_map

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>')
  -- TODO: ?
  -- buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  -- buf_map(bufnr, 'n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>')
  -- definitions
  -- buf_map(bufnr, 'n', 'gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>')
  -- reference
  buf_map(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
  -- diagnostics
  buf_map(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<CR>')
  -- signature help
  buf_map(bufnr, 'n', 'gs', '<cmd>lua require("lsp_signature").signature()<CR>')
  -- hover
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
end

return M
