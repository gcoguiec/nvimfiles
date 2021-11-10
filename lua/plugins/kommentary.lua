local map = vim.api.nvim_set_keymap

-- mappings
map('n', '<Leader>/', '<plug>kommentary_line_default', { silent = true })
map('v', '<Leader>/', '<plug>kommentary_visual_default', { silent = true })

require('kommentary.config').configure_language('default', {
  prefer_single_line_comments = true
})
