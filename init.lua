-- load basic configuration
-- options, mappings, commands
for _, module_name in ipairs({'options', 'mappings', 'commands'}) do
    require(module_name).init()
end

-- load plugins
require "plugins"

