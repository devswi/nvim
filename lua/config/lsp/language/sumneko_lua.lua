return {
    settings = {
        Lua = {
            runtime = {
                -- LuaJIT in the case of Neovim
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'root',         -- awesomeWM
                    'awesome',      -- awesomeWM
                    'screen',       -- awesomeWM
                    'client',       -- awesomeWM
                    'clienteys',   -- awesomeWM
                    'clientbuttons',-- awesomeWM
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        }
    }
}

