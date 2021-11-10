local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

autopairs.setup {
  autopairs = { enable = true },
  disable_filetype = { 'TelescopePrompt' },
  html_break_line_filetype = {
    'html',
    'vue',
    'typescriptreact',
    'svelte',
    'javascriptreact'
  },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
  enable_check_bracket_line = false,
  check_ts = true,
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
    java = false
  },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', '\'', '`' },
    pattern = string.gsub([[ [%'%"%`%+%)%>%]%)%}%,%s] ]], '%s+', ''),
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    hightlight = 'Search'
  }
}

autopairs.add_rules {
  Rule(' ', ' '):with_pair(function(opts)
    local pair = opts.line:sub(opts.col - 1, opts.col)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end),
  Rule('(', ')'):with_pair(function(opts)
    return opts.prev_char:match '.%)' ~= nil
  end):use_key ')',
  Rule('{', '}'):with_pair(function(opts)
    return opts.prev_char:match '.%}' ~= nil
  end):use_key '}',
  Rule('[', ']'):with_pair(function(opts)
    return opts.prev_char:match '.%]' ~= nil
  end):use_key ']'
}

cmp.event:on('confirm_done',
  cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
