if vim.g.vscode then
  require('vscode.init')
  vim.cmd('source ' .. '$HOME/.config/nvim/lua/vscode/settings.vim')
  return
end

do
  local ok, _ = pcall(require, 'impatient')

  if not ok then
    vim.notify(vim.log.levels.WARN, 'impatient.nvim not installed')
  end
end

local mods = {
  'compiled',
  'core',
  'theme',
}

for _, mod in ipairs(mods) do
  local ok, err = pcall(require, mod)

  if mod == 'compiled' and not ok then
    vim.notify('warn', 'Run :PackerCompile!')
  elseif not ok then
    vim.notify('error', ('Error loading %s..\n\n%s'):format(mod, err))
  end
end
