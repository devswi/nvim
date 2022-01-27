local util = require('lspconfig').util

local stylua = {
    formatCommand = 'stylua -s --quote-style AutoPreferSingle --indent-type Spaces --indent-width 2 -',
    formatStdin = true,
}

local languages = {
    lua = { stylua },
}

return {
    init_options = {
        documentFormatting = true,
        codeAction = true,
    },
    root_dir = util.root_pattern('package.json', '.git/', '.zshrc'),
    filetypes = vim.tbl_keys(languages),
    settings = {
        languages = languages,
    }
}
