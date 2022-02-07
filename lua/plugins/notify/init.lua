local icons = require('theme.icons')

local notify = require('notify')

notify.setup({
    icons = {
        ERROR = icons.error,
        WARN = icons.WARN,
        INFO = icons.info,
        DEBUG = icons.debug,
        TRACE = icons.trace,
    },
    stages = 'slide',
    background_colour = require('theme.colors').bg
})

vim.notify = notify
require('plugins.notify.highlights')
