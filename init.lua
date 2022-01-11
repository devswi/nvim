-- load basic configuration
-- options, mappings, commands
--
for _, module_name in ipairs({'mappings', 'options', 'commands'}) do
    require(module_name).init()
end

-- Themes
-- embark
-- nord
local theme = "nord"
local colors = require("colors")
colors.set(theme)

-- load plugins
require "plugins"

