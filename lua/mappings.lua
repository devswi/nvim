local M = {}

-- common options
local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
    insert_mode = generic_opts_any,
    normal_mode = generic_opts_any,
    visual_mode = generic_opts_any,
    visual_block_mode = generic_opts_any,
    command_mode = generic_opts_any,
    term_mode = { silent = true },
}

local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c",
}

local keymappings = {
    -- @usage change or add keymappings for insert mode
    insert_mode = {
        -- 'jj' for quitting insert mode
        ["jj"] = "<ESC>",
        ["jk"] = "<ESC>",
        ["kk"] = "<ESC>",
        -- Move current line / block with alt-j/k
        ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
        ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    },
    -- @usage change or add keymappings for normal mode
    normal_mode = {
        -- Better window movement
        ["<C-h>"] = "<C-w>h",
        ["<C-j>"] = "<C-w>j",
        ["<C-k>"] = "<C-w>k",
        ["<C-l>"] = "<C-w>l",
        -- Resize with arrows
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",
        -- Move current line / block with Alt-j/k a la vscode.
        ["<A-j>"] = ":m .+1<CR>==",
        ["<A-k>"] = ":m .-2<CR>==",
        -- Save
        ["<C-s>"] = ":w<CR>",
    },
    -- @usage change or add keymappings for terminal mode
    term_mode = {
        -- Terminal window navigation
        ["<C-h>"] = "<C-\\><C-N><C-w>h",
        ["<C-j>"] = "<C-\\><C-N><C-w>j",
        ["<C-k>"] = "<C-\\><C-N><C-w>k",
        ["<C-l>"] = "<C-\\><C-N><C-w>l",
    },
    -- @usage change or add keymappings for visual mode
    visual_mode = {
        -- Better indenting
        ["<"] = "<gv",
        [">"] = ">gv",
    },
    -- @usage change or add keymappings for visual block mode
    visual_block_mode = {
        -- Move selectd line / block with Alt-j/k
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv",
    },
    -- @usage change or add keymappings for command mode
    command_mode = {
        -- navigate tab completion with <c-j> and <c-k>
        ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
        ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
    }
}

if vim.fn.has "mac" == 1 then
    keymappings.normal_mode["<A-Up>"] = keymappings.normal_mode["<C-Up>"]
    keymappings.normal_mode["<A-Down>"] = keymappings.normal_mode["<C-Down>"]
    keymappings.normal_mode["<A-Left>"] = keymappings.normal_mode["<C-Left>"]
    keymappings.normal_mode["<A-Right>"] = keymappings.normal_mode["<C-Right>"]
end

function M.set_keymaps(mode, key, val) 
    local opt = generic_opts[mode] or generic_opts_any
    if type(val) == "table" then
        opt = val[2]
        val = val[1]
    end
    if val then
        vim.api.nvim_set_keymap(mode, key, val, opt)
    else
        pcall(vim.api.nvim_del_keymap, mode, key)
    end
end

function M.load_mode(mode, keymaps)
    mode = mode_adapters[mode] or mode
    for k, v in pairs(keymaps) do
        M.set_keymaps(mode, k, v)
    end
end

-- Load key mappings for all provded modes
function M.load(keymaps)
    keymaps = keymaps or {}
    for mode, mapping in pairs(keymaps) do
        M.load_mode(mode, mapping)
    end
end

-- Load the default keymappings
function M.load_defaults() 
    M.load(M.get_defaults())
end

function M.get_defaults()
    return keymappings
end

M.init = function()
    local global = vim.g

    -- set leader key as <space>
    global.mapleader = " "

    M.load_defaults()
end

return M
