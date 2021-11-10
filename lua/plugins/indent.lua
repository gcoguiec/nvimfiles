local hi = require('utils.hi')
local li = require('utils.li')
local colors = require('colors')

-- highlights
li('IndentBlanklineSpaceChar', 'NonText')
li('IndentBlanklineChar', 'NonText')
li('IndentBlanklineSpaceCharBlankline', 'NonText')
hi('IndentBlanklineContextStart', colors.primary, nil, 'underline')
hi('IndentBlanklineContextChar', colors.primary)

require('indent_blankline').setup {
  use_treesitter = true,
  buftype_exclude = { 'prompt', 'terminal' },
  filetype_exclude = {
    'git',
    'help',
    'man',
    'alpha',
    'lsp-installer',
    'lspinfo',
    'packer',
    'Trouble'
  },
  show_first_indent_level = false,
  show_current_context = true
}
