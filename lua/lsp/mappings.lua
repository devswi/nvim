local M = {}

-- Mappings.
function M.init(_, bufnr)
  local buf_map = require('utils').buf_map

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
  -- TODO: ?
  -- buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  buf_map(bufnr, 'n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
  -- definitions
  buf_map(bufnr, 'n', 'gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>')
  -- reference
  buf_map(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
  -- code rename
  buf_map(bufnr, 'n', 'gn', '<cmd>lua require("lsp.rename").rename()<cr>')
  buf_map(bufnr, 'n', '<leader>cr', '<cmd>lua require("lsp.rename").rename()<cr>')

  -- diagnostics
  buf_map(bufnr, 'n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  buf_map(bufnr, 'n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  buf_map(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>')
  buf_map(bufnr, 'n', '<leader>cd', '<cmd>Telescope diagnostics bufnr=0<cr>')

  -- hover
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

  -- code actions
  buf_map(bufnr, 'n', 'ca', '<cmd>Lspsaga code_action<CR>')
  buf_map(bufnr, 'v', 'ca', '<cmd>Lspsaga range_code_action<CR>')
  buf_map(bufnr, 'n', '<leader>ca', '<cmd>Lspsaga code_action<CR>')
  buf_map(bufnr, 'v', '<leader>ca', '<cmd>Lspsaga range_code_action<CR>')

  -- formatting
  buf_map(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
  buf_map(bufnr, 'v', '<leader>cf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')

  -- signature help
  buf_map(bufnr, 'n', 'gs', '<cmd>lua require("lsp_signature").signature()<cr>')

  -- lsp workspace
  buf_map(bufnr, 'n', '<leader>wd', '<cmd>Telescope diagnostics<cr>')
  buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
  buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
  buf_map(
    bufnr,
    'n',
    '<leader>wl',
    '<cmd>lua require("utils.logger"):log(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>'
  )

  -- typescript helpers
  buf_map(bufnr, 'n', '<leader>co', ':TSLspOrganize<CR>')
  buf_map(bufnr, 'n', '<leader>ci', ':TSLspImportAll<CR>')
end

return M
