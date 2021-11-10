local global = vim.g
local map = vim.api.nvim_set_keymap
local colors = require('colors')
local vars = require('vars')
local hi = require('utils.hi')
local li = require('utils.li')

-- mappings
map('n', '<Leader>gh', '<cmd>BufferPrevious<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>gl', '<cmd>BufferNext<cr>', { noremap = true, silent = true })
map('n', '<Leader>bo', '<cmd>BufferCloseAllButCurrent<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>q', '<cmd>BufferClose!<cr>', { noremap = true, silent = true })

-- hightlights
hi('BufferCurrent', colors.text0, colors.bg3)
li('BufferVisible', 'BufferCurrent')
hi('BufferInactive', colors.secondary, colors.bg2)
hi('BufferCurrentIcon', nil, nil)
hi('BufferVisibleIcon', nil, nil)
hi('BufferInactiveIcon', nil, nil)
hi('BufferCurrentMod', colors.text0, colors.bg3, 'bold')
li('BufferVisibleMod', 'BufferCurrentMod')
hi('BufferInactiveMod', colors.secondary, colors.bg2, 'bold')
hi('BufferCurrentSign', colors.golden_poppy, colors.bg3)
hi('BufferVisibleSign', colors.mauve, colors.bg3)
hi('BufferInactiveSign', colors.mauve, colors.bg2)
hi('BufferOffset', colors.primary, colors.bg0)
hi('BufferTabpageFill', nil, colors.bg0)
hi('BufferTabpages', colors.mauve, colors.mauve)

-- configuration
global.bufferline = {
  animation = false,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = true,
  maximum_padding = 1,
  maximum_length = 24,
  icon_close_tab = vars.barbar.close_icon,
  icon_separator_active = vars.barbar.separator,
  icon_separator_inactive = vars.barbar.separator,
  icon_close_tab_modified = vars.barbar.modified_icon,
  icon_pinned = vars.barbar.pinned_icon
}
