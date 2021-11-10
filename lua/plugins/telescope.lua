local map = vim.api.nvim_set_keymap
local colors = require('colors')
local hi = require('utils.hi')
local li = require('utils.li')
local vars = require('vars')

local dropdown = { theme = 'dropdown', previewer = false }
local ivy = {
  theme = 'ivy',
  previewer = false,
  border = false,
  layout_config = { height = 10 }
}

require('telescope').load_extension('fzf')

-- mappings
map('n', '<Leader>P', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>p',
  '<cmd>lua require(\'telescope.builtin\').find_files()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>tl',
  '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader><space>',
  '<cmd>lua require(\'telescope.builtin\').buffers()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>tf',
  '<cmd>lua require(\'telescope.builtin\').file_browser()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>st',
  '<cmd>lua require(\'telescope.builtin\').treesitter()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>ch',
  '<cmd>lua require(\'telescope.builtin\').command_history()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>sc', '<cmd>lua require(\'telescope.builtin\').commands()<cr>',
  { noremap = true, silent = true })
map('n', '<Leader>sq', '<cmd>lua require(\'telescope.builtin\').quickfix()<cr>',
  { noremap = true, silent = true })

-- highlights
vim.schedule(function()
  hi('TelescopeNormal', colors.text0, colors.bg1)
  li('TelescopePreviewNormal', 'TelescopeNormal')
  hi('TelescopeBorder', colors.bg1, colors.bg1)
  li('TelescopePreviewBorder', 'TelescopeBorder')
  li('TelescopeResultsBorder', 'TelescopeBorder')
  hi('TelescopeSelection', nil, colors.bg3)
  hi('TelescopeSelectionCaret', colors.primary, colors.bg3)
end)

require('telescope').setup {
  defaults = {
    prompt_prefix = vars.telescope.prompt_prefix,
    mappings = { i = { ['<c-u>'] = false, ['<c-d>'] = false } }
  },
  pickers = {
    git_files = dropdown,
    find_files = dropdown,
    buffers = dropdown,
    file_browser = ivy,
    lsp_references = ivy
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case'
    }
  }
}
