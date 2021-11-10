local map = vim.api.nvim_set_keymap
local hi = require('utils.hi')
local colors = require('colors')
local vars = require('vars')

-- highlights
hi('TroubleCount', colors.mint_green)
hi('TroubleNormal', colors.text0, colors.bg2)
hi('TroubleTextInformation', colors.text0)
hi('TroubleText', colors.text0)
hi('TroubleTextError', colors.text0)
hi('TroubleTextWarning', colors.whote)
hi('TroubleTextHint', colors.text0)
hi('TroubleSignWarning', colors.orange_red)
hi('TroubleSignInformation', colors.maya_blue)
hi('TroubleSignHint', colors.maya_blue)
hi('TroubleSignOther', colors.maya_blue)
hi('TroubleSignError', colors.scarlet)
hi('TroubleLocation', colors.secondary)
hi('TroubleIndent', nil)
hi('TroubleFoldIcon', colors.silver)
hi('TroubleSource', colors.perano)
hi('TroubleCode', colors.heliotrope, nil, 'underline')
hi('TroubleFile', colors.primary)

-- mappings
map('n', '<Leader>oo', '<cmd>TroubleToggle<cr>',
  { silent = true, noremap = true })
map('n', '<Leader>od', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>',
  { silent = true, noremap = true })
map('n', '<Leader>ow', '<cmd>TroubleToggle lsp_document_diagnostics<cr>',
  { silent = true, noremap = true })
map('n', '<Leader>oq', '<cmd>TroubleToggle quickfix<cr>',
  { silent = true, noremap = true })

require('trouble').setup {
  position = 'right',
  group = true,
  auto_open = false,
  auto_close = true,
  indent_lines = false,
  icons = true,
  width = 100,
  signs = {
    error = vars.signs.error,
    warning = vars.signs.warn,
    hint = vars.signs.hint,
    information = vars.signs.info,
    other = vars.signs.other
  },
  action_keys = {}
}
