return {
  debug = false,
  profile = false,
  enable = {
    telescope = true,
    treesitter = true,
    lsp = true,
    git = true,
    comfort = true
  },
  cache_dir = vim.env.HOME .. '/.cache/nvim/',
  tree_width = 40,
  tree_offset_label = ' ﬦ',
  signs = {
    error = '',
    warn = '',
    hint = '',
    info = '',
    other = ''
  },
  gitsigns = {
    add = '│',
    change = '│',
    delete = '_',
    topdelete = '‾',
    changedelete = ''
  },
  lsp = {
    kind_signs = {
      nvim_lua = ' ',
      nvim_lsp = ' ',
      treesitter = ' ',
      luasnip = ' ',
      buffer = ' ﬘',
      path = ' '
    },
    symbol_signs = {
      Text = '',
      Method = '',
      Function = '',
      Constructor = '',
      Field = 'ﰠ',
      Variable = '',
      Class = 'ﴯ',
      Interface = '',
      Module = '',
      Property = 'ﰠ',
      Unit = '塞',
      Value = '',
      Enum = '',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Reference = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = 'פּ',
      Event = '',
      Operator = '',
      TypeParameter = ''
    }
  },
  lsp_signature = { hint_prefix = ' ' },
  telescope = { prompt_prefix = ' ' },
  barbar = {
    close_icon = '',
    modified_icon = '●',
    pinned_icon = '車',
    separator = ''
  },
  packer = {
    symbols = {
      working = '⟳',
      error = '',
      done = '',
      removed = '',
      moved = '',
      header = ''
    }
  },
  octo = {
    symbols = {
      user_icon = ' ',
      timeline_marker = '',
      right_bubble_delimiter = '',
      left_bubble_delimiter = '',
      reaction_viewer_hint_icon = ''
    }
  }
}
