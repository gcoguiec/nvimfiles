local config = vim.o
local colors = require('colors')
local vars = require('vars')
local default_theme = { fg = colors.secondary, bg = colors.bg1 }

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = {
      normal = {
        a = { fg = colors.primary, bg = colors.bg1 },
        b = default_theme,
        c = default_theme,
        x = default_theme,
        y = default_theme,
        z = default_theme
      },
      inactive = {
        a = default_theme,
        b = default_theme,
        c = default_theme,
        x = default_theme,
        y = default_theme,
        z = default_theme
      }
    },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true
  },
  sections = {
    lualine_a = { { 'mode' } },
    lualine_b = {
      { 'branch', icon = '' },
      {
        'diagnostics',
        colored = false,
        always_visible = true,
        sources = { 'nvim_lsp' },
        sections = { 'error', 'warn' },
        symbols = {
          error = vars.signs.error .. ' ',
          warn = vars.signs.warn .. ' '
        }
      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      { 'location' },
      function()
        local mode = config.expandtab == true and 'Space' or 'Tab'
        local count = config.expandtab == true and config.shiftwidth or
                        config.tabstop
        return mode .. ':' .. count
      end,
      { 'encoding' },
      { 'fileformat', icons_enabled = false },
      { 'filetype', colored = false }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {}
}
