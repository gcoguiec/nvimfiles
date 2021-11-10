local map = vim.api.nvim_set_keymap
local vars = require('vars')

-- mappings
map('n', '<Leader>qs', '<cmd>lua require("persistence").load()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>ql',
  '<cmd>lua require("persistence").load({ last = true })<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>qd', '<cmd>lua require("persistence").stop()<cr>',
  { noremap = true, silent = true })

require('persistence').setup {
  dir = vim.fn.expand(vars.cache_dir .. 'sessions/'),
  options = { 'buffers', 'curdir', 'tabpages', 'winsize' }
}
