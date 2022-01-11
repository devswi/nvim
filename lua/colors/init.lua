local M = {}

M.set = function(theme)
    -- search for the theme colors
    local success, colors = pcall(require, string.format("colors.%s", theme))
    if success then
        M.set_colorscheme(colors, theme)
    else
        vim.cmd("colorscheme " .. theme)
    end
end

M.set_colorscheme = function(hl, theme)
    if not hl or not hl.c then return end
    vim.cmd('highlight clear')

    if vim.g.syntax_on ~= nil then
        vim.cmd('syntax reset')
    end

    vim.cmd('set t_Co=256')
    vim.o.background = 'dark'
    vim.g.colors_name = "lua-" .. theme

    local colors = hl.c
    local bg = colors.bg or colors.black
    local fg = colors.fg or colors.white
    local red = colors.red
    local dark_red = colors.dark_red
    local green = colors.green
    local dark_green = colors.dark_green or colors.green
    local yellow = colors.yellow
    local dark_yellow = colors.dark_yellow
    local blue = colors.blue
    local dark_blue = colors.dark_blue or colors.blue
    local purple = colors.purple
    local dark_purple = colors.dark_purple or colors.purple
    local cyan = colors.cyan
    local dark_cyan = colors.dark_cyan or colors.cyan
    local white = colors.white or colors.fg
    local black = colors.black or colors.bg
    local comment_grey = colors.comment_grey
    local visual_grey = colors.visual_grey
    local special_grey = colors.special_grey

    local terminal_italics = vim.g.nvimlua_terminal_italics or false

    if (vim.g.nvimlua_termcolors or 256) == 16 then
        for _, color in pairs(colors) do
            color.cterm = color.cterm16
            color.cterm16 = nil
        end
    end

    -- 256-color terminal colors
    vim.g.terminal_ansi_colors = {
        special_grey.gui,
        red.gui,
        green.gui,
        yellow.gui,
        blue.gui,
        purple.gui,
        cyan.gui,
        white.gui,
        visual_grey.gui,
        dark_red.gui,
        dark_green.gui,
        dark_yellow.gui,
        dark_blue.gui,
        dark_purple.gui,
        dark_cyan.gui,
        comment_grey.gui,
    }

    local function h(group, style)
        if not terminal_italics then
            if style.cterm == 'italic' then
                style.cterm = nil
            end
            if style.gui == 'italic' then
                style.gui = nil
            end
        end

        local guifg, guibg, guisp, ctermfg, ctermbg

        if style.fg then
            guifg = style.fg.gui
            ctermfg = style.fg.cterm
        else
            guifg = 'NONE'
            ctermfg = 'NONE'
        end

        if style.bg then
            guibg = style.bg.gui
            ctermbg = style.bg.cterm
        else
            guibg = 'NONE'
            ctermbg = 'NONE'
        end

        if style.sp then
            guisp = style.sp.gui
        else
            guisp = 'NONE'
        end

        local gui = style.gui or 'NONE'
        local cterm = style.cterm or 'NONE'

        local hi = 'highlight ' .. group
            .. ' guifg=' .. guifg
            .. ' guibg=' .. guibg
            .. ' guisp=' .. guisp
            .. ' gui=' .. gui
            .. ' ctermfg=' .. ctermfg
            .. ' ctermbg=' .. ctermbg
            .. ' cterm=' .. cterm

        vim.api.nvim_command(hi)
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
