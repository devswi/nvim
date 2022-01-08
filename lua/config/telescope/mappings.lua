
local M = {}

M.setup = function()
    local keymappings = require "mappings"

    keymappings.load({
        normal_mode = {
            ["<leader>fb"] = ":Telescope buffers <CR>",
            ["<leader>ff"] = ":Telescope find_files <CR>",
            ["<leader>fa"] = ":Telescope find_files no_ignore=true hidden=true <CR>",
            ["<leader>gc"] = ":Telescope git_commits <CR>",
            ["<leader>gs"] = ":Telescope git_status <CR>",
            ["<leader>fh"] = ":Telescope help_tags <CR>",
            ["<leader>fw"] = ":Telescope live_grep <CR>",
            ["<leader>fo"] = ":Telescope oldfiles <CR>",
        }
    })


end

return M
