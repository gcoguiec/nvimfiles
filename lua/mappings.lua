local map = vim.api.nvim_set_keymap

local nop_list = { '<Up>', '<Down>', '<Left>', '<Right>' }

for _, nop in pairs(nop_list) do
  local opts = { noremap = true, silent = true }
  map('n', nop, '<nop>', opts)
  map('i', nop, '<nop>', opts)
end

map('n', '<Space>', '<nop>', { noremap = true, silent = true })
map('x', '<Space>', '<nop>', { noremap = true, silent = true })
