local modules = {
    'core.disabled',
    'core.editor',
    'core.plugins',
    'core.commands',
    'core.mappings',
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)

    if not ok and not mod:find('config') then
        error(('Error loading %s...\n\n%s'):format(module, err))
    end
end
