local M = {}

M.setup = function() 
    local keymappings = require "mappings"

    keymappings.load({
        normal_mode = {
            ["<TAB>"] = ":BufferLineCycleNext<CR>",
            ["<S-TAB>"] = ":BufferLineCyclePrev<CR>",
            ["<C-x>"] = ":BufferLinePickClose<CR>",
        }
    })

    local bufferline = require "bufferline"
    bufferline.setup {
        options = {
            show_buffer_close_icons = false,
            show_close_icon = false,
            max_name_length = 14,
            tab_size = 20,
        }
    }
end

return M
