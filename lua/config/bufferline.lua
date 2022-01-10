local keymappings = require "mappings"

keymappings.load({
    normal_mode = {
        ["<TAB>"] = ":BufferLineCycleNext<CR>",
        ["<S-TAB>"] = ":BufferLineCyclePrev<CR>",
        ["<C-x>"] = ":BufferLinePickClose<CR>",
    }
})

local bufferline = require("bufferline")

bufferline.setup {
    options = {
        numbers = "none",
        indicator_icon = "▎",
        offsets = {
            { filetype = "NvimTree", text = "", padding = 1 }
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        max_name_length = 14,
        tab_size = 20,
        separator_style = "thin",
    },
}

