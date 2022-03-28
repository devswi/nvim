local defaults = require('lsp.providers.defaults')
local null_ls = require('null-ls')
local merge = require('utils.init').merge

local file_map = {
  '.prettierrc',
  '.prettierrc.json',
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.yml',
  '.eslintrc.json',
}

local function condition(utils)
  return utils.root_has_file(file_map)
end

require('null-ls').setup(merge(defaults, {
  sources = {
    null_ls.builtins.code_actions.eslint_d.with({
      prefer_local = 'node_modules/.bin',
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      prefer_local = 'node_modules/.bin',
    }),
    null_ls.builtins.formatting.eslint_d.with({
      prefer_local = 'node_modules/.bin',
      condition = condition,
    }),
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prettierd.with({
      env = {
        PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
      },
    }),
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.json_tool.with({
      condition = function(utils)
        return not utils.root_has_file(file_map)
      end,
    }),
    null_ls.builtins.formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file({ 'stylua.toml', '.stylua.toml' })
      end,
    }),
    null_ls.builtins.code_actions.gitsigns,
  },
}))
