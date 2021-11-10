local map = vim.api.nvim_set_keymap
local global = vim.g
local hi = require('utils.hi')
local li = require('utils.li')
local colors = require('colors')
local vars = require('vars')
local handlers = require('handlers')

-- highlights
hi('LspDiagnosticsDefaultError', colors.brink_pink)
hi('LspDiagnosticsSignError', colors.brink_pink, colors.bg2)
li('LspDiagnosticsFloatingError', 'LspDiagnosticsDefaultError')
li('LspDiagnosticsVirtualTextError', 'LspDiagnosticsDefaultError')
hi('LspDiagnosticsUnderlineError', colors.brink_pink, nil, 'undercurl')
hi('LspDiagnosticsDefaultWarning', colors.orange_red)
hi('LspDiagnosticsSignWarning', colors.orange_red, colors.bg2)
li('LspDiagnosticsFloatingWarning', 'LspDiagnosticsDefaultWarning')
li('LspDiagnosticsVirtualTextWarning', 'LspDiagnosticsDefaultWarning')
hi('LspDiagnosticsUnderlineWarning', colors.orange_red, nil, 'undercurl')
hi('LspDiagnosticsDefaultInformation', colors.maya_blue)
hi('LspDiagnosticsSignInformation', colors.maya_blue, colors.bg2)
li('LspDiagnosticsFloatingInformation', 'LspDiagnosticsDefaultInformation')
li('LspDiagnosticsVirtualTextInformation', 'LspDiagnosticsDefaultInformation')
hi('LspDiagnosticsUnderlineInformation', colors.maya_blue, nil, 'undercurl')
hi('LspDiagnosticsDefaultHint', colors.alice_blue)
hi('LspDiagnosticsSignHint', colors.alice_blue, colors.bg2)
li('LspDiagnosticsFloatingHint', 'LspDiagnosticsDefaultHint')
li('LspDiagnosticsVirtualTextHint', 'LspDiagnosticsDefaultHint')
hi('LspDiagnosticsUnderlineHint', colors.alice_blue, nil, 'undercurl')
hi('LspReferenceText', nil, colors.scampi)
li('LspReferenceRead', 'LspReferenceText')
li('LspReferenceWrite', 'LspReferenceText')
li('DiagnosticVirtualTextError', 'LspDiagnosticsVirtualTextError')
li('DiagnosticFloatingError', 'LspDiagnosticsFloatingError')
li('DiagnosticSignError', 'LspDiagnosticsSignError')
li('DiagnosticUnderlineError', 'LspDiagnosticsUnderlineError')
li('DiagnosticVirtualTextWarn', 'LspDiagnosticsVirtualTextWarning')
li('DiagnosticFloatingWarn', 'LspDiagnosticsFloatingWarning')
li('DiagnosticSignWarn', 'LspDiagnosticsSignWarning')
li('DiagnosticUnderlineWarn', 'LspDiagnosticsUnderlineWarning')
li('DiagnosticVirtualTextInfo', 'LspDiagnosticsVirtualTextInformation')
li('DiagnosticFloatingInfo', 'LspDiagnosticsFloatingInformation')
li('DiagnosticSignInfo', 'LspDiagnosticsSignInformation')
li('DiagnosticUnderlineInfo', 'LspDiagnosticsUnderlineInformation')
li('DiagnosticVirtualTextHint', 'LspDiagnosticsVirtualTextHint')
li('DiagnosticFloatingHint', 'LspDiagnosticsFloatingHint')
li('DiagnosticSignHint', 'LspDiagnosticsSignHint')
li('DiagnosticUnderlineHint', 'LspDiagnosticsUnderlineHint')

-- mappings
map('n', '<leader>li', '<cmd>LspInfo<cr>', { noremap = true, silent = true })
map('n', '<leader>ll', '<cmd>LspLog<cr>', { noremap = true, silent = true })
map('n', '<leader>lr', '<cmd>LspRestart<cr>', { noremap = true, silent = true })
map('n', '<leader>lt', '<cmd>lua require(\'handlers\').toggle_diag()<cr>',
  { noremap = true, silent = true })

-- signs
local signs = {
  Error = vars.signs.error .. ' ',
  Warning = vars.signs.warn .. ' ',
  Hint = vars.signs.hint .. ' ',
  Information = vars.signs.info .. ' '
}
for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

global.diagnostics_active = false
handlers.toggle_diag()
