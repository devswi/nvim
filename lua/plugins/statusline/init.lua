local res, statusline = pcall(require, "lualine")
if not res then
    return
end

local config = require('config')
local colors = require('theme.colors')
local icons = require('theme.icons')
local main_icon = icons.ghost

local icons_with_trailing_space = function(icon)
    return icon .. ' '
end

local filename = {
    {
        'filetype',
        icon_only = true,
    },
    {
        'filename',
        path = 1,             -- relative path
        shorting_target = 100, -- shorten long paths
        file_status = true,   -- show modified/readonly
        symbols = { modified = ' ' .. icons.unsave, readonly = ' ' .. icons.readonly },
    },
}

local function lsp_name()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then
        return nil
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end

    return nil
end

local lsp_tbl = {
    function()
        return lsp_name()
    end,
    cond = function()
        return lsp_name() ~= nil
    end,
    -- icon = ' ',
    icon = icons.lsp .. ' ',
    color = { fg = colors.bg, bg = colors.IncSearch },
}

statusline.setup({
    options = {
        theme = config.theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            'packer',
            'dashboard',
            'NvimTree',
            'floaterm',
            'fugitive',
            'fugitiveblame',
        }
    },
    sections = {
        -- lualine_a = {{'mode'}},
        lualine_a = {
            {
                'mode',
                fmt = function(str) return main_icon .. ' ' .. str end
            }
        },
        lualine_b = {
            -- {'branch', icon = '', color = { fg = colors.Label, gui = 'bold' }},
            { 'branch', icon = '' },
            {
                'diff',
                symbols = { added = icons.diff_add, modified = icons.diff_modified, removed = icons.diff_remove },
                diff_color = {
                    added = { fg = colors.DiffAdd },
                    modified = { fg = colors.DiffChange },
                    removed = { fg = colors.DiffDelete },
                },
            }
        },
        lualine_c = filename,
        lualine_x = {
            {
                'diagnostics',
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = icons_with_trailing_space(icons.error),
                    warn = icons_with_trailing_space(icons.warn),
                    info = icons_with_trailing_space(icons.info),
                    hint = icons_with_trailing_space(icons.hint),
                },
                diagnostics_color = {
                    error = { fg = colors.DiagnosticError },
                    warn  = { fg = colors.DiagnosticWarn },
                    info  = { fg = colors.DiagnosticInfo },
                    hint  = { fg = colors.DiagnosticHint },
                },
                -- color = { bg = colors.String },
            },
            lsp_tbl
        },
        lualine_y = {
            {
                'fileformat',
                symbols = {
                    unix = icons.unix, -- 
                    dos = icons.dos,
                    mac = icons.mac,
                }
            },
            { 'encoding' },
            -- char under cursor in he
            { '%B', fmt = function(str) return '0x'..str end }
        },
        lualine_z = {
            { 'progress' },
            { 'location'},
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = filename,
        lualine_x = {{'fileformat'},{'encoding'},{'progress'},{'location'}},
        lualine_y = {},
        lualine_z = {},
    },
})

