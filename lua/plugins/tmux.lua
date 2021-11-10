local map = vim.api.nvim_set_keymap

-- mappings
local opts = { noremap = true, silent = true, nowait = true }
map('n', '<M-z>', '<cmd>lua require(\'tmux\').move_top()<cr>', opts)
map('n', '<M-q>', '<cmd>lua require(\'tmux\').move_left()<cr>', opts)
map('n', '<M-s>', '<cmd>lua require(\'tmux\').move_bottom()<cr>', opts)
map('n', '<M-d>', '<cmd>lua require(\'tmux\').move_right()<cr>', opts)
map('n', '<C-M-z>', '<cmd>lua require(\'tmux\').resize_top()<cr>', opts)
map('n', '<C-M-q>', '<cmd>lua require(\'tmux\').resize_left()<cr>', opts)
map('n', '<C-M-s>', '<cmd>lua require(\'tmux\').resize_bottom()<cr>', opts)
map('n', '<C-M-d>', '<cmd>lua require(\'tmux\').resize_right()<cr>', opts)

require('tmux').setup {
  navigation = { enable_default_keybindings = false },
  resize = {
    enable_default_keybindings = false,
    resize_step_x = 2,
    resize_step_y = 2
  }
}
