local icons = require('theme.icons')
local g = vim.g

g.dashboard_custom_header = {
  '',
  '',
  '',
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  '',
  '',
  '',
  '',
}

g.dashboard_default_executive = 'telescope'

g.dashboard_session_directory = vim.fn.stdpath('data') .. '/sessions'

g.dashboard_custom_section = {
  find_file = {
    description = { icons.file1 .. ' Find File           <leader>f ' },
    command = 'Telescope find_files',
  },
  file_explorer = {
    description = { icons.file2 .. ' File Manager        <C-n>     ' },
    command = 'NvimTreeToggle',
  },
  find_string = {
    description = { icons.word .. ' Grep String         <leader>st' },
    command = 'Telescope grep_string',
  },
}

g.dashboard_custom_footer = { 'Cease to struggle and you cease to live.' }
