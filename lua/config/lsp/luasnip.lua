local res, luasnip = pcall(require, "luasnip")
if not res then
    return
end

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

local ok, loaders = pcall(require, "luasnip/loaders/from_vscode")

if not ok then
    return
end

loaders.lazy_load()

