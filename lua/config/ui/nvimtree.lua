local M = {}

function M.global_settings()
    local g = vim.g

    g.nvim_tree_add_trailing = 0
    g.nvim_tree_git_hl = 0
    g.nvim_tree_highlight_opened_files = 0
    g.nvim_tree_indent_markers = 1 -- set indent markers to 0, if small arrow needed
    g.nvim_tree_quit_on_open = 0 -- close tree when file's opened
    g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

    g.nvim_tree_window_picker_exclude = {
       filetype = { "notify", "packer", "qf" },
       buftype = { "terminal" },
    }

    g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 0,
        lsp = 1,
    }

    g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            deleted = "",
            ignored = "◌",
            renamed = "➜",
            staged = "✓",
            unmerged = "",
            unstaged = "✗",
            untracked = "★",
        },
        folder = {
            arrow_open = "",
            arrow_close = "",
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
        },
    }
end

function M.set_mappings()
    local keymappings = require "mappings"

    keymappings.load({
        normal_mode = {
            ["<C-n>"] = ":NvimTreeToggle <CR>",
            ["<leader>e"] = ":NvimTreeFocus <CR>",
        }
    })
end

M.setup = function()
    M.global_settings()
    M.set_mappings()

    require("nvim-tree").setup {
        filters = {
            dotfiles = true,
            custom = {
                ".DS_Store",
            }
        },
        disable_netrw = true,
        hijack_netrw = true,
        ignore_ft_on_setup = { "dashboard" },
        auto_close = true,
        open_on_tab = false,
        hijack_cursor = true,
        update_cmd = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            allow_resize = false,
            side = "left",
            width = 30,
            hide_root_folder = true,
        },
        git = {
            ignore = true,
        },
        diagnostics = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
    }
end

return M
