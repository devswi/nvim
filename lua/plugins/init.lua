local fn, _ = vim.fn, vim.api.nvim_command
local install_path = fn.stdpath "data" .. "/site/pack/pakcer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocompile
vim.cmd [[
autocmd BufWritePost init.lua PackerCompile
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    git = {
        clone_timeout = 300,
        subcommands = {
            fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress"
        },
    },
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use {
        "wbthomason/packer.nvim",
    }

    local plugins_modules = {
        "editor",
        "ui",
        "tools",
        "lsp",
    }

    -- install plugins
    for _, module_name in ipairs(plugins_modules) do
        local m = require("plugins." .. module_name)
        m.install_plugins(use)
    end
end)

