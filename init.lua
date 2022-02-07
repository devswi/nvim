do
    local ok, _ = pcall(require, 'impatient')

    if not ok then
        vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
    end
end

local mods = {
    'compiled',
    'core',
}

for _, mod in ipairs(mods) do
    local ok, err = pcall(require, mod)
    if mod == 'compiled' and not ok then
        vim.notify('Run :PackerCompile!', vim.log.levels.WARN, {
            title='neovim',
        })
    elseif not ok and not mod:find('config') then
        error(('Error loading %s...\n\n%s'):format(mod, err))
    end
end
