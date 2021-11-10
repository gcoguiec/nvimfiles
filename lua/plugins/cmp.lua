local li = require('utils.li')
local hi = require('utils.hi')
local colors = require('colors')
local vars = require('vars')
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

-- highlights
li('CmpDocumentation', 'PMenu')
hi('CmpDocumentationBorder', colors.bg0)
hi('CmpItemAbbr', colors.text0)
hi('CmpItemAbbrDeprecated', colors.periwinkle)
hi('CmpItemAbbrMatch', colors.gold)
hi('CmpItemAbbrMatchFuzzy', colors.gold)
hi('CmpItemMenu', nil, colors.bg0)
hi('CmpItemKind', colors.secondary)

cmp.setup {
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 4 },
    { name = 'path' }
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  formatting = {
    format = function(entry, vim_item)
      local lspkind_format = lspkind.cmp_format({
        with_text = true,
        menu = vars.lsp.kind_signs,
        maxwidth = 60
      })
      vim_item.abbr = vim_item.abbr:gsub('^%s+', '')
      return lspkind_format(entry, vim_item)
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  }
}
