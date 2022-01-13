local res, comment = pcall(require, "Comment")
if not res then return end

comment.setup({
    padding = true,
    sticky = true,
    -- NORMAL mode line-wise mappings
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    -- NORMAL+VISUAL mode operator mappings
    opleader = {
        line = "gl",
        block = "gc",
    },
    extra = {
        above = "gcO", -- Add comment on the line above
        below = "gco", -- Add comment on the line below
        eol = "gcA", -- Add comment at the end of line
    },
    mappings = {
        basic = true,
        extra = true,
        extended = false, -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    },
    pre_hook = function(ctx)
        if not vim.tbl_contains({ "typescript", "typescriptreact" }, vim.bo.ft) then
            return
        end

        local comment_utils = require("Comment.utils")
        local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

        local location
        if ctx.ctype == comment_utils.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
            key = type,
            location = location,
        })
    end
})
