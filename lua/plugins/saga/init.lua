local saga = require('lspsaga')

saga.init_lsp_saga({
  code_action_icon = '💡',
  code_action_prompt = {
    enable = true,
    sign = false,
    sign_priority = 15,
    virtual_text = false,
  },
  code_action_keys = { quit = { 'q' }, exec = '<CR>' },
  border_style = 'round',
})
