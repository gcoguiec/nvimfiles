local li = require('utils.li')
local vars = require('vars')

-- highlights
li('LspSignatureActiveParameter', 'IncSearch')

require('lsp_signature').setup {
  bind = true,
  floating_window = true,
  floating_window_above_cur_line = true,
  hint_enable = true,
  fix_pos = false,
  timer_interval = 100,
  zindex = 200,
  hint_prefix = vars.lsp_signature.hint_prefix,
  padding = ' ',
  extra_trigger_chars = {},
  handler_opts = { border = 'none' }
}
