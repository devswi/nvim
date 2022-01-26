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
end

global:load_variables()

return global
