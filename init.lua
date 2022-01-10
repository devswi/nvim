-- load basic configuration
-- options, mappings, commands
--
for _, module_name in ipairs({'mappings', 'options', 'commands'}) do
    require(module_name).init()
end

local colors = require "colors"
colors.set("embark")

-- load plugins
require "plugins"

