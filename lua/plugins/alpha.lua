local map = vim.api.nvim_set_keymap
local dashboard = require('alpha.themes.dashboard')

-- mappings
map('n', '<Leader>h', '<cmd>Alpha<cr>', { noremap = true, silent = true })

dashboard.section.buttons.val = {
  dashboard.button('o', '  Open last session',
    '<cmd>lua require(\'persistence\').load()<cr>'),
  dashboard.button('f', '  Finder',
    '<cmd>lua require(\'telescope.builtin\').find_files()<cr>'),
  dashboard.button('e', '  New file', '<cmd>ene<cr>'),
  dashboard.button('q', '  Quit neovim', '<cmd>qa<cr>')
}

require('alpha').setup {
  layout = { { type = 'padding', val = 10 }, dashboard.section.buttons },
  opts = { margin = 4 }
}
