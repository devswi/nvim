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
  ['w'] = { '<cmd>w!<CR>', 'Save' },
  ['q'] = { '<cmd>q!<CR>', 'Quit' },
  ['c'] = { '<cmd>bdelete!<CR>', 'Close Buffer' },
  ['f'] = { '<cmd>lua require("plugins.telescope.mappings").project_files()<CR>', 'Find File' },
  ['h'] = { '<cmd>nohlsearch<CR>', 'No Highlight' },
  ['v'] = { '<C-w>v', 'Split Right' },
  ['V'] = { '<C-w>s', 'Split Below' },
  ['r'] = { ':NvimTreeRefresh<CR>', 'File Explorer Refresh' },
  ['+'] = { '<cmd>vertical resize +2<CR>', 'Resize +2' },
  ['-'] = { '<cmd>vertical resize -2<CR>', 'Resize -2' },
  ['='] = { '<C-w>=', 'Balance Windows' },

  b = {
    name = 'Buffers',
    j = { '<cmd>BufferLinePick<CR>', 'Jump' },
    f = { ':Telescope buffers<CR>', 'Find' },
    p = { '<cmd>BufferLineCyclePrev<CR>', 'Previous' },
    e = {
      '<cmd>BufferLinePickClose<CR>',
      'Pick which buffer to close',
    },
    h = { '<cmd>BufferLineCloseLeft<CR>', 'Close all to the left' },
    l = {
      '<cmd>BufferLineCloseRight<CR>',
      'Close all to the right',
    },
    n = { '<cmd>BufferLineCycleNext<CR>', 'Next' },
    D = {
      '<cmd>BufferLineSortByDirectory<CR>',
      'Sort by directory',
    },
    L = {
      '<cmd>BufferLineSortByExtension<CR>',
      'Sort by language',
    },
  },

  p = {
    name = 'Packer',
    c = { '<cmd>PackerCompile<CR>', 'Compile' },
    i = { '<cmd>PackerInstall<CR>', 'Install' },
    s = { '<cmd>PackerSync<CR>', 'Sync' },
    S = { '<cmd>PackerStatus<CR>', 'Status' },
    u = { '<cmd>PackerUpdate<CR>', 'Update' },
  },

  g = {
    name = 'Git',
    g = { '<cmd>lua gitui_toggle()<cr>', 'gitui' },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", 'Next Hunk' },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", 'Prev Hunk' },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", 'Blame' },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", 'Preview Hunk' },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", 'Reset Hunk' },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", 'Reset Buffer' },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", 'Stage Hunk' },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
      'Undo Stage Hunk',
    },
    o = { '<cmd>Telescope git_status<CR>', 'Open changed file' },
    b = { '<cmd>Telescope git_branches<CR>', 'Checkout branch' },
    c = { '<cmd>Telescope git_commits<CR>', 'Checkout commit' },
    C = {
      '<cmd>Telescope git_bcommits<CR>',
      'Checkout commit(for current file)',
    },
    d = {
      '<cmd>lua require("plugins.diffview").toggle()<cr>',
      'Git Diff',
    },
  },

  l = {
    name = 'LSP',
    a = { '<cmd>Lspsaga code_action<CR>', 'Code Action' },
    d = { '<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>', 'Buffer Diagnostics' },
    w = { '<cmd>Telescope diagnostics<CR>', 'Diagnostics' },
    f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format' },
    i = { '<cmd>LspInfo<CR>', 'Info' },
    I = { '<cmd>LspInstallInfo<CR>', 'Installer Info' },
    j = {
      '<cmd>lua vim.diagnostic.goto_next()<CR>',
      'Next Diagnostic',
    },
    k = {
      '<cmd>lua vim.diagnostic.goto_prev()<CR>',
      'Prev Diagnostic',
    },
    r = { '<cmd>lua require("lsp.rename").rename()<CR>', 'Rename' },
    s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
    S = {
      '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
      'Workspace Symbols',
    },
  },

  m = {
    name = 'Markdown',
    p = { '<cmd>MarkdownPreview<CR>', 'Markdown Preview' },
  },

  s = {
    name = 'Search',
    b = { '<cmd>Telescope git_branches<CR>', 'Checkout branch' },
    c = { '<cmd>Telescope colorscheme<CR>', 'Colorscheme' },
    f = { '<cmd>Telescope find_files<CR>', 'Find File' },
    h = { '<cmd>Telescope help_tags<CR>', 'Find Help' },
    M = { '<cmd>Telescope man_pages<CR>', 'Man Pages' },
    r = { '<cmd>Telescope oldfiles<CR>', 'Open Recent File' },
    R = { '<cmd>Telescope registers<CR>', 'Registers' },
    t = { '<cmd>Telescope live_grep<CR>', 'Text' },
    k = { '<cmd>Telescope keymaps<CR>', 'Keymaps' },
    C = { '<cmd>Telescope commands<CR>', 'Commands' },
    p = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>",
      'Colorscheme with Preview',
    },
  },
}

local wk = require('which-key')

-- normal mode
wk.register(mappings, opts)

-- visual mode
wk.register({
  l = {
    name = 'LSP',
    a = { '<cmd>Lspsaga range_code_action<CR>', 'Code Action' },
    f = { '<cmd>lua vim.lsp.buf.range_formatting()<CR>', 'Format' },
  },
}, {
  mode = 'v',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
