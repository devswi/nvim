local lsp_installer_servers = require("nvim-lsp-installer.servers")

local servers = {
    'cssls',
    'dockerls',
    'eslint',
    'graphql',
    'html',
    'jsonls',
    'sumneko_lua',
    'tsserver',
    'solargraph',
    'gopls',
}

for _, server in ipairs(servers) do
    local ok, language_server = lsp_installer_servers.get_server(server)

    if ok then
        if not language_server:is_installed() then
            language_server:install()
        end
    end
end
