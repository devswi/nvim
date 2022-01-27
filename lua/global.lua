local global = {}
local os_name = vim.loop.os_uname().sysname

function global:load_variables()
    local fn = vim.fn

    self.is_mac = os_name == "Darwin"
    self.is_linux = os_name == "Linux"
    self.is_windows = os_name == "Windows"
    self.vim_path = fn.stdpath("config")
    local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")

    self.home = home

    local servers = {
        efm = {
            format = true,
        },
        gopls = {
            format = true,
        },
    }

    self.lsp = {
        format_on_save = true,
        servers = servers,
        can_client_format = function(client_name)
            if servers[client_name] == true then
                return true
            end

            if servers[client_name] then
                return servers[client_name].format
            end
        end,
    }
end

global:load_variables()

return global
