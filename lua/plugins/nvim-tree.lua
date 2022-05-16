local global = vim.g
local map = vim.api.nvim_set_keymap
local vars = require('vars')
local colors = require('colors')
local hi = require('utils.hi')
local li = require('utils.li')
local tree_cb = require('nvim-tree.config').nvim_tree_callback
local events = require('nvim-tree.events')

-- globals
global.nvim_tree_git_hl = 1
global.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1
}
global.nvim_tree_special_files = {}
global.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = 'M',
    staged = 'S',
    unmerged = 'C',
    renamed = 'R',
    untracked = 'U',
    deleted = 'D',
    ignored = 'I'
  },
  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = ''
  }
}

-- highlights
hi('NvimTreeRootFolder', colors.secondary, colors.bg2, 'bold')
hi('NvimTreeFolderName', colors.secondary)
hi('NvimTreeIndentMarker', colors.silver)
li('NvimTreeSpecialFolderName', 'NvimTreeFolderName')
li('NvimTreeOpenedFolderName', 'NvimTreeFolderName')
li('NvimTreeEmptyFolderName', 'NvimTreeFolderName')
hi('NvimTreeEndOfBuffer', colors.text0, colors.bg2)
hi('NvimTreeNormal', colors.secondary, colors.bg2)
li('NvimTreeSymlink', 'NvimTreeNormal')
li('NvimTreeSpecialFile', 'NvimTreeNormal')
li('NvimTreeExecFile', 'NvimTreeNormal')
li('NvimTreeImageFile', 'NvimTreeNormal')
li('NvimTreeOpenedFile', 'NvimTreeNormal')
hi('NvimTreeNormalNC', colors.secondary, colors.bg2)
hi('NvimTreeVertSplit', colors.lucky_point, colors.bg2)
hi('NvimTreeCursorLine', colors.text0, colors.bg3)
hi('NvimTreeStatusLine', colors.secondary, colors.bg1)
hi('NvimTreeStatuslineNC', colors.bg1, colors.bg1)
hi('NvimTreeSignColumn', colors.secondary, colors.bg2)
hi('NvimTreeGitDirty', colors.primary)
hi('NvimTreeGitNew', colors.mint_green)
li('NvimTreeGitRenamed', 'NvimTreeGitDirty')
hi('NvimTreeGitIgnored', colors.scampi)
hi('NvimTreeGitDeleted', colors.brink_pink)
hi('NvimTreeGitMerge', colors.gold)
hi('NvimTreeFolderIcon', colors.botticelli)
hi('NvimTreeWindowPicker', colors.primary, colors.bg2)

-- mappings
map('n', '<c-b>', '<cmd>lua require(\'handlers\').toggle_tree()<cr>',
  { noremap = true, silent = true })
map('n', '<leader>R', '<cmd>NvimTreeRefresh<cr>',
  { noremap = true, silent = true })
map('n', '<leader>F', '<cmd>NvimTreeFindFile<cr>',
  { noremap = true, silent = true })

-- events
events.on_nvim_tree_ready(function() require('handlers').toggle_tree() end)
events.on_tree_open(function() require('handlers').handle_tree_open() end)
events.on_tree_close(function() require('handlers').handle_tree_close() end)

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  open_on_tab = true,
  update_cwd = false,
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = { 'help', 'git' }
  },
  update_to_buf_dir = { enable = true, auto_open = true },
  ignore_ft_on_setup = { 'git', 'man', 'help' },
  system_open = { cmd = nil, args = {} },
  diagnostics = {
    enable = true,
    icons = { hint = '', info = '', warning = '', error = '×' }
  },
  view = {
    width = vars.tree_width,
    hide_root_folder = true,
    auto_resize = true,
    side = 'left',
    mappings = {
      custom_only = true,
      list = { { key = { '<CR>', '<2-LeftMouse>' }, cb = tree_cb('edit') } }
    }
  },
  actions = {
    open_file = { window_picker = { exclude = { filetype = { 'packer' } } } }
  },
  git = { ignore = true },
  renderer = { indent_markers = { enable = false } },
  filters = { dotfiles = true, custom = { 'node_modules', 'dist' } }
}
