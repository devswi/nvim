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
    }
})
