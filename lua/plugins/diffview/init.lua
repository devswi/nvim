---@diagnostic disable: different-requires
local M = {}

local diffview = require('diffview')

M.init = function()
  local cb = require('diffview.config').diffview_callback

  diffview.setup({
    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
    use_icons = true, -- Requires nvim-web-devicons
    icons = { -- Only applies when use_icons is true.
      folder_closed = '',
      folder_open = '',
    },
    signs = {
      fold_closed = '',
      fold_open = '',
    },
    file_panel = {
      position = 'left', -- One of 'left', 'right', 'top', 'bottom'
      width = 35, -- Only applies when position is 'left' or 'right'
      height = 10, -- Only applies when position is 'top' or 'bottom'
      listing_style = 'tree', -- One of 'list' or 'tree'
      tree_options = { -- Only applies when listing_style is 'tree'
        flatten_dirs = true, -- Flatten dirs that only contain one single dir
        folder_statuses = 'only_folded', -- One of 'never', 'only_folded' or 'always'.
      },
    },
    file_history_panel = {
      position = 'bottom',
      width = 35,
      height = 16,
      log_options = {
        max_count = 256, -- Limit the number of commits
        follow = false, -- Follow renames (only for single file)
        all = false, -- Include all refs under 'refs/' including HEAD
        merges = false, -- List only merge commits
        no_merges = false, -- List no merge commits
        reverse = false, -- List commits in reverse order
      },
    },
    default_args = { -- Default args prepended to the arg-list for the listed commands
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
    hooks = {}, -- See ':h diffview-config-hooks'
    key_bindings = {
      disable_defaults = true, -- Disable the default key bindings
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      view = {},
      file_panel = {},
      file_history_panel = {},
      option_panel = {},
    },
  })
end

M.toggle = function()
  local lib = require('diffview.lib')
  local view = lib.get_current_view()
  if view == nil then
    diffview.file_history()
    return
  end

  if view then
    view:close()
    lib.dispose_view(view)
  end
end

return M
