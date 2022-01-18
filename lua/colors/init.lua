local M = {}

M.set = function(theme)
    -- search for the theme colors
    local success, colors = pcall(require, string.format("colors.%s", theme))
    if success then
        if not colors or not colors.c then
            if colors.config ~= nil then
                colors.config()
            end
        else
            M.set_colorscheme(colors, theme)
        end
    else
        vim.cmd("colorscheme " .. theme)
    end
end

M.set_colorscheme = function(hl, theme)
    if not hl or not hl.c then return end
    vim.cmd("highlight clear")

    if vim.g.syntax_on ~= nil then
        vim.cmd('syntax reset')
    end

    vim.cmd("set t_Co=256")
    vim.o.background = 'dark'
    vim.g.colors_name = "lua-" .. theme

    if hl.before ~= nil then
        hl.before()
    end

    local function h(group, color)
        local style = color.style and "gui=" .. color.style or "gui=NONE"
        local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
        local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
        local sp = color.sp and "guisp=" .. color.sp or ""

        local hlCommand = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

        vim.api.nvim_command(hlCommand)

        if color.link then vim.cmd("highlight! link " .. group .. " " .. color.link) end
    end

    for _, t in ipairs({
        hl.common,
        hl.syntax,
        hl.ts,
        hl.lsp,
        hl.others,
    }) do
        for k, v in pairs(t) do h(k, v) end
    end

    hl.after()
end

return M
