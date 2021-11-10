local hi = require('utils.hi')
local li = require('utils.li')
local colors = require('colors')

-- highlights
li('TSBoolean', 'Boolean')
li('TSCharacter', 'TSString')
li('TSConditional', 'Conditional')
li('TSComment', 'Comment')
li('TSConstructor', 'TSConstant')
li('TSConstant', 'Identifier')
hi('TSConstBuiltin', colors.mauve)
li('TSConstMacro', 'TSConstant')
li('TSError', 'Constant')
li('TSException', 'Structure')
hi('TSField', colors.text0)
li('TSFloat', 'Constant')
li('TSFuncBuiltin', 'Keyword')
li('TSFuncMacro', 'Structure')
li('TSFunction', 'Structure')
li('TSInclude', 'Keyword')
li('TSKeyword', 'Keyword')
li('TSKeywordOperator', 'Keyword')
li('TSKeywordReturn', 'Keyword')
li('TSKeywordFunction', 'Keyword')
li('TSLabel', 'Structure')
li('TSMethod', 'Structure')
li('TSNamespace', 'TSConstant')
li('TSNumber', 'Constant')
li('TSOperator', 'Structure')
li('TSParameter', 'TSConstant')
li('TSParameterReference', 'TSConstant')
li('TSProperty', 'TSConstant')
hi('TSPunctDelimiter', colors.primary)
hi('TSPunctBracket', colors.danube)
hi('TSPunctSpecial', colors.witch_haze)
li('TSRepeat', 'Keyword')
li('TSString', 'String')
li('TSStringRegex', 'TSConstant')
hi('TSStringEscape', colors.cinnabar)
li('TSSymbol', 'TSConstant')
li('TSStrong', 'TSConstant', nil, 'italic')
hi('TSType', colors.aquamarine)
li('TSTypeBuiltin', 'TSType')
hi('TSTag', colors.aquamarine)
hi('TSTagDelimiter', colors.columbia_blue)
li('TSTagAttribute', 'Structure')
li('TSText', 'String')
hi('TSTextReference', colors.paua, colors.text0)
hi('TSEmphasis', colors.columbia_blue, nil, 'italic')
hi('TSUnderline', nil, nil, 'underline')
hi('TSStrike', nil)
hi('TSTitle', colors.gold)
hi('TSLiteral', colors.aquamarine)
hi('TSURI', colors.mint_green, nil, 'underline')
hi('TSMath', colors.columbia_blue)
li('TSVariable', 'TSConstant')
hi('TSVariableBuiltin', colors.mauve)
li('TSIdentifier', 'Identifier')
hi('TSNodeUnmatched', colors.secondary)

require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true },
  autopairs = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true, disable = { 'c', 'ruby' } },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 9999,
    colors = { colors.cream_can, colors.danube, colors.east_side }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    }
  },
  lsp_interop = {
    enable = true,
    peek_definition_code = { ['Df'] = '@function.outer', ['DF'] = '@class.outer' }
  },
  refactor = {
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = true },
    smart_rename = { enable = true, keymaps = { smart_rename = '<Leader>gr' } },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions = 'gnD',
        list_definitions_toc = 'gO'
      }
    }
  },
  context_commentstring = { enable = true, enable_autocmd = false },
  textobjects = {
    keymaps = {
      ['<Leader>fo'] = '@function.outer',
      ['<Leader>fi'] = '@function.inner',
      ['<Leader>Co'] = '@class.outer',
      ['<Leader>Ci'] = '@class.inner',
      ['<Leader>co'] = '@conditional.outer',
      ['<Leader>ci'] = '@conditional.inner',
      ['<Leader>bo'] = '@block.outer',
      ['<Leader>bi'] = '@block.inner',
      ['<Leader>lo'] = '@loop.outer',
      ['<Leader>li'] = '@loop.inner',
      ['<Leader>si'] = '@statement.inner',
      ['<Leader>so'] = '@statement.outer',
      ['<Leader>mo'] = '@comment.outer',
      ['<Leader>ao'] = '@call.outer',
      ['<Leader>ai'] = '@call.inner'
    },
    select = { enable = true, lookahead = true },
    swap = {
      enable = true,
      swap_next = { ['<Leader>pin'] = '@parameter.inner' },
      swap_previous = { ['<Leader>pis'] = '@parameter.inner' }
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
      goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' }
    }
  }
}
