require('which-key').setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = 'Comments' },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  window = {
    border = 'single', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = { '<leader>' }, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
})

local opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local mappings = {
  -- ignore
  ['1'] = 'which_key_ignore',
  ['2'] = 'which_key_ignore',
  ['3'] = 'which_key_ignore',
  ['4'] = 'which_key_ignore',
  ['5'] = 'which_key_ignore',
  ['6'] = 'which_key_ignore',
  ['7'] = 'which_key_ignore',
  ['8'] = 'which_key_ignore',
  ['9'] = 'which_key_ignore',

  -- single
  ['+'] = { '<cmd>vertical resize +2<CR>', 'resize +2' },
  ['-'] = { '<cmd>vertical resize -2<CR>', 'resize -2' },
  ['='] = { '<C-w>=', 'balance windows' },
  ['v'] = { '<C-w>v', 'split right' },
  ['V'] = { '<C-w>s', 'split below' },

  -- dashboard
  ['/'] = {
    name = 'Dashboard',
    ['/'] = { '<cmd>Dashboard<CR>', 'open dashboard' },
    ['c'] = { ':e $MYVIMRC<CR>', 'open init' },
    ['s'] = { '<cmd>PackerSync<CR>', 'packer sync' },
    ['u'] = { '<cmd>PackerUpdate<CR>', 'packer update' },
  },

  -- actions
  ['a'] = {
    name = 'Actions',
    m = { '<cmd>MarkdownPreview<CR>', 'markdown preview' },
  },

  -- buffer
  b = {
    name = 'Buffer',
    b = { '<cmd>BufferLineMovePrev<CR>', 'Move back' },
    f = { '<cmd>bfirst<CR>', 'First Buffer' },
    l = { '<cmd>BufferLineCloseLeft<CR>', 'Close Left' },
    r = { '<cmd>BufferLineCloseRight<CR>', 'Close Right' },
    n = { '<cmd>BufferLineMoveNext<CR>', 'Move Next' },
    p = { '<cmd>BufferLinePick<CR>', 'Pick Buffer' },
    x = { ':bdelete!<CR>', 'Close Buffer' },
  },

  -- code
  c = {
    name = 'LSP',
    a = { 'code action' },
    f = { 'format' },
    d = { 'current buffer disgnostics' },
    r = { 'rename' },
    o = { 'organize imports' },
    i = { 'import all' },
  },

  g = {
    name = 'Git',
    d = { '<cmd>lua require("plugins.diffview").toggle()<CR>', 'diff file' },
    g = {
      'gitui',
    },
  },

  w = {
    name = 'WorkSpace',
    a = { 'add wordspace folder' },
    d = { 'workspace disgnostics' },
    r = { 'remove wordspace folder' },
  },
}

local wk = require('which-key')
wk.register(mappings, opts)
