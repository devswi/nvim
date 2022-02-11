local ls = require('luasnip')

-- Every unspecified option will be set to the default.
ls.config.set_config({
  history = true,
  -- Update more often, :h events for more info.
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
})

ls.filetype_extend('javascript', { 'javascriptreact', 'html', 'css' })
ls.filetype_extend('javascriptreact', { 'html', 'css' })

ls.filetype_extend('typescript', { 'typescriptreact', 'html', 'css' })
ls.filetype_extend('typescriptreact', { 'html', 'css' })

ls.filetype_extend('vue', { 'html', 'css' })

require('luasnip/loaders/from_vscode').load({
  include = {
    'html',
    'javascriptreact',
    'typescriptreact',
    'javascript',
    'typescript',
    'lua',
    'markdown',
    'ruby',
    'css',
    'rust',
    'shell',
    'go',
    'vue',
    'rails',
    -- 'flutter',
  },
})
