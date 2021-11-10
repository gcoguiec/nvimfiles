local colors = require('colors')
local vars = require('vars')
local hi = require('utils.hi')

-- highlights
hi('GitSignsAdd', colors.harlequin, colors.bg2)
hi('GitSignsChange', colors.tangerine_yellow, colors.bg2)
hi('GitSignsDelete', colors.cinnabar, colors.bg2)

require('gitsigns').setup {
  debug_mode = vars.debug,
  signcolumn = true,
  numhl = true,
  linehl = false,
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = vars.gitsigns.add,
      numhl = 'LineNr',
      linehl = 'LineNr'
    },
    change = {
      hl = 'GitSignsChange',
      text = vars.gitsigns.change,
      numhl = 'LineNr',
      linehl = 'GitSignsChangeLn'
    },
    delete = {
      hl = 'GitSignsDelete',
      text = vars.gitsigns.delete,
      numhl = 'LineNr',
      linehl = 'GitSignsDeleteLn'
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = vars.gitsigns.topdelete,
      numhl = 'LineNr',
      linehl = 'GitSignsDeleteLn'
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = vars.gitsigns.changedelete,
      numhl = 'LineNr',
      linehl = 'GitSignsChangeLn'
    }
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ['n ]c'] = {
      expr = true,
      '&diff ? \']c\' : \'<cmd>lua require("gitsigns").next_hunk()<cr>\''
    },
    ['n [c'] = {
      expr = true,
      '&diff ? \'[c\' : \'<cmd>lua require("gitsigns").prev_hunk()<cr>\''
    },
    ['n <Leader>Gs'] = '<cmd>lua require("gitsigns").stage_hunk()<cr>',
    ['n <Leader>Gu'] = '<cmd>lua require("gitsigns").undo_stage_hunk()<cr>',
    ['n <Leader>Gr'] = '<cmd>lua require("gitsigns").reset_hunk()<cr>',
    ['n <Leader>Gp'] = '<cmd>lua require("gitsigns").preview_hunk()<cr>',
    ['n <Leader>Gb'] = '<cmd>lua require("gitsigns").blame_line()<cr>'
  },
  watch_gitdir = { interval = 1000 },
  current_line_blame = false,
  current_line_blame_opts = { delay = 500, position = 'eol' },
  sign_priority = 6,
  update_debounce = 100,
  diff_opts = { internal = true },
  status_formatter = nil
}
