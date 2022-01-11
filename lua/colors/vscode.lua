local colors = {}

colors.config = function()
    vim.g.vscode_style = "dark"
    vim.g.vscode_itaclic_comment = 1

    vim.cmd[[colorscheme vscode]]
end

return colors
