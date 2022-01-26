if not pcall(require, "lspconfig") or not pcall(require, "nvim-lsp-installer") then
    return
end

-- Setup icons & handler helper functions
require('config.lsp.diag')
require('config.lsp.icons')
require('config.lsp.handlers')

-- default 'on_attach' function
local on_attach = require('config.lsp.on_attach').on_attach

-- Enable borders for hover/signature help
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- enables snippet support
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    if pcall(require, 'cmp_nvim_lsp') then
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    end
    return {
        on_attach = on_attach,
        capabilities = capabilities,
        autostart = true,
        debounce_text_changes = 150,
    }
end

local requested_servers = {
    'efm',
    'tsserver',
    'gopls', -- go
    'graphql',
    'sumneko_lua',
    'tailwindcss',
    'jsonls',
    'cssls',
    'html',
    'dockerfile',
    'solargraph', -- ruby
}

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
        keymaps = {
            toggle_server_expand = '<CR>',
            install_server = 'i',
            update_server = 'u',
            update_all_servers = 'U',
            uninstall_server = 'X',
        }
    }
}

local lsp_installer_servers = require('nvim-lsp-installer.servers')
for _, requested_server in pairs(requested_servers) do
    local ok, server = lsp_installer_servers.get_server(requested_server)
    if ok then
        if not server:is_installed() then
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local opts = make_config()

    if server.name == 'sumneko_lua' then
        opts = vim.tbl_deep_extend('force', opts, require('config.lsp.language.sumneko_lua'))
    elseif false then
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

