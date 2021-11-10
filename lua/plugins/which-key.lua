local colors = require('colors')
local hi = require('utils.hi')

-- highlights
hi('WhichKey', colors.text0)
hi('WhichKeyGroup', colors.primary)
hi('WhichKeySeparator', colors.secondary)
hi('WhichKeyDesc', colors.text0)
hi('WhichKeyFloat', nil, colors.bg0)
hi('WhichKeyValue', colors.mint_green)

require('which-key').setup { window = { border = 'none' } }
