vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { "latex" },
    },
    ensure_installed = "maintained",
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["if"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]["] = "@function.outer",
                ["]m"] = "@class.outer",
            },
            goto_next_end = {
                ["]]"] = "@function.outer",
                ["]M"] = "@class.outer"
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[m"] = "@class.outer"
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
                ["[M"] = "@class.outer"
            }
        },
    },
}
