-- load basic configuration
-- options, mappings, commands
--
for _, module_name in ipairs({'mappings', 'options', 'commands'}) do
    require(module_name).init()
end

-- load plugins
require "plugins"

