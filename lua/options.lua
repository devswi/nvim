local M = {}

M.init = function()
    local opt = vim.opt

    opt.encoding = "utf-8"

    -- enable line number and relative line number
    opt.number = true
    opt.numberwidth = 2
    opt.relativenumber = true

    -- line behind cursor
    opt.cursorline = true

    -- [[
    -- TAB SETTING
    --
    -- ]]--
    opt.expandtab = true
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4

    -- Copy indent from current line when starting a new line
    opt.autoindent = true

    -- A List is an ordered sequence of items.
    opt.list = true
    opt.listchars = "tab:-->,trail:·"

    opt.clipboard = "unnamedplus"

    -- Minimal number of screen lines to keep above and below the cursor.
    opt.scrolloff = 8
    opt.sidescrolloff = 8

    -- Force all horizontal splits to go below current window
    opt.splitbelow = true
    -- Force all vertical splits to go below current window
    opt.splitright = true

    -- Time in milliseconds to wait for a key code sequence to complete
    opt.timeoutlen = 400
    opt.updatetime = 250

    -- remember where to recover cursor
    opt.viewoptions = 'cursor,folds,slash,unix'

    opt.pumheight = 20
    -- colors
    opt.termguicolors = true

    -- [[
    -- lines longer than the width of the window will wrap and displaying continues
    -- on the next line.
    -- ]]
    opt.wrap = true
    opt.textwidth = 0
    opt.cindent = true
    opt.showmode = false
    opt.showcmd = true

    -- always show tabs
    opt.showtabline = 2

    -- auto completion on command
    opt.wildmenu = true

    -- ignore case when searching and only on searching
    opt.ignorecase = true
    opt.hlsearch = true

    opt.shortmess:append "sI"
    opt.whichwrap:append "<>[]hl"

    opt.inccommand = 'split'
    opt.completeopt = {"menuone", "noselect", "menu"}
    opt.ttyfast = true
    opt.lazyredraw = true
    opt.visualbell = true
    opt.virtualedit = 'block'
    opt.lazyredraw = true
    opt.signcolumn = "yes:1"
    opt.mouse = 'a'

    opt.foldmethod = 'indent'
    opt.foldlevel = 99
    opt.foldenable = true
    opt.formatoptions = 'qj'

    opt.hidden = true

    -- Changed home directory here
    local backup_dir = vim.fn.stdpath("cache") .. "/backup"
    local backup_stat = pcall(os.execute, "mkdir -p " .. backup_dir)
    if backup_stat then
        opt.backupdir = backup_dir
        opt.directory = backup_dir
    end

    local undo_dir = vim.fn.stdpath("cache") .. "/undo"
    local undo_stat = pcall(os.execute, "mkdir -p " .. undo_dir)
    local has_persist = vim.fn.has("persistent_undo")
    if undo_stat and has_persist == 1 then
        opt.undofile = true
        opt.undodir = undo_dir
    end
end

return M
