-- load basic configuration
-- options, mappings, commands
--
for _, module_name in ipairs({'mappings', 'options', 'commands'}) do
    require(module_name).init()
end

-- load plugins
require "plugins"

-- Themes
-- embark
-- tokyonight
-- vscode
local theme = "tokyonight"
local colors = require("colors")
colors.set(theme)

