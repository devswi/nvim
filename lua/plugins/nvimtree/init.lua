local g = vim.g
local icons = require('theme.icons')

-- settings
g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 0
g.nvim_tree_root_folder_modifier = table.concat({ ':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??' })
g.nvim_tree_refresh_wait = 300

g.nvim_tree_special_files = {}

g.nvim_tree_window_picker_exclude = {
  filetype = { 'notify', 'packer', 'qf' },
  buftype = { 'terminal' },
}

g.nvim_tree_icons = {
  default = '',
  symlink = icons.symlink,
  git = icons.git,
  folder = icons.folder,

  lsp = {
    hint = icons.hint,
    info = icons.info,
    warning = icons.warn,
    error = icons.error,
  },
}

g.nvim_tree_respect_buf_cwd = 1

-- set up args
require('nvim-tree').setup({
  filters = {
    dotfiles = false,
    custom = {
      '.DS_Store',
      'node_modules/',
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  open_on_tab = false,
  update_cmd = true,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    width = 35,
    side = 'left',
    allow_resize = false,
    hide_root_folder = true,
  },
  git = {
    ignore = true,
  },
  diagnostics = {
    enable = false,
  },
})
