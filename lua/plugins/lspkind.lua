local vars = require('vars')

require('lspkind').init {
  with_text = true,
  preset = 'default',
  symbol_map = vars.lsp.symbol_signs
}
