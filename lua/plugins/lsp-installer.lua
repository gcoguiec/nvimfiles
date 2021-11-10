local util = require('lspconfig/util')
local lsp_installer = require('nvim-lsp-installer')
local lsp_signature = require('lsp_signature')
local vars = require('vars')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap('n', '<Leader>e',
    '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<Leader>sa',
    '<cmd>lua require\'telescope.builtin\'.lsp_code_actions(require\'telescope.themes\'.get_cursor())<cr>',
    opts)
  buf_set_keymap('n', '<Leader>sr',
    '<cmd>lua require\'telescope.builtin\'.lsp_references()<cr>', opts)
  buf_set_keymap('n', '<Leader>sy',
    '<cmd>lua require\'telescope.builtin\'.lsp_document_symbols()<cr>', opts)
  buf_set_keymap('n', '<Space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>',
      opts)
  end

  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('v', '<Leader>f',
      '<cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)
  end

  lsp_signature.on_attach({
    bind = true,
    floating_window = false,
    hint_prefix = vars.lsp_signature.hint_prefix
  })
end

-- volar
local function volar_opts(_, opts)
  opts.filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'json',
    'vue'
  }
  opts.init_options = {
    typescript = { serverPath = '', localizedPath = nil },
    languageFeatures = {
      semanticTokens = true,
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      renameFileRefactoring = true,
      signatureHelp = true,
      codeAction = true,
      completion = {
        defaultTagNameCase = 'both',
        defaultAttrNameCase = 'kebabCase'
      },
      schemaRequestService = true,
      documentHighlight = true,
      documentLink = true,
      codeLens = true,
      diagnostics = true
    }
  }
  opts.root_dir = function(fname)
    return util.root_pattern('tsconfig.json', 'vue.config.js')(fname) or
             util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  end
  opts.on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
  end
  return opts
end

-- eslint
local function eslint_opts(_, opts)
  opts.filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue'
  }
  opts.settings = {
    validate = 'on',
    packageManager = 'yarn',
    useESLintClass = false,
    codeActionOnSave = { enable = false, mode = 'all' },
    format = true,
    quiet = false,
    onIgnoredFiles = 'off',
    rulesCustomizations = {},
    run = 'onType',
    nodePath = '',
    workingDirectory = { mode = 'auto' },
    codeAction = {
      disableRuleComment = { enable = true, location = 'separateLine' },
      showDocumentation = { enable = true }
    }
  }
  return opts
end

-- stylelint
local function stylelint_lsp_opts(_, opts)
  opts.filetypes = {
    'css',
    'scss',
    'vue',
    'svelte',
    'javascriptreact',
    'typescriptreact'
  }
  return opts
end

-- deno
local function denols_opts(_, opts)
  opts.filetypes = { filetypes = { 'typescript' } }
  opts.root_dir = function(fname)
    if util.root_pattern('package.json', 'node_modules', '.eslintrc.js',
      '.eslintrc.json')(fname) then return nil end
    return
      util.root_pattern('deno.json', 'deno.jsonc', 'tsconfig.json', '.git')(
        fname)
  end
  return opts
end

-- clangd
local function clangd_opts(_, opts)
  opts.filetypes = { 'c', 'cpp' }
  opts.cmd = {
    'clangd',
    '--background-index',
    '--completion-style=detailed',
    '--suggest-missing-includes',
    '--header-insertion=never',
    '-j=32'
  }
  return opts
end

-- sumneko
local function sumneko_lua_opts()
  return require('lua-dev').setup({
    lspconfig = { capabilities = capabilities, on_attach = on_attach }
  })
end

-- rust-analyzer
local function rust_analyzer_opts(_, opts)
  opts.filetypes = { 'rust' }
  opts.settings = { ['rust-analyzer'] = {} }
  return opts
end

-- zls
local function zls_opts(_, opts)
  opts.filetypes = { 'zig', 'zir' }
  return opts
end

local servers = {
  volar = volar_opts,
  eslint = eslint_opts,
  stylelint_lsp = stylelint_lsp_opts,
  denols = denols_opts,
  clangd = clangd_opts,
  sumneko_lua = sumneko_lua_opts,
  rust_analyzer = rust_analyzer_opts,
  zls = zls_opts
}

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗'
    }
  }
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 }
  }
  if servers[server.name] then opts = servers[server.name](server, opts) end
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
