require('formatter.util').print = function() end

local exts = {
  '*.rs',
  '*.ts',
  '*.tsx',
  '*.c',
  '*.h',
  '*.cmake',
  '*.nix',
  '*.hcl',
  '*.lua',
  '*.js',
  '*.jsx',
  '*.sh',
  '*.py',
  '*.go',
  '*.html',
  '*.json',
  '*.json5',
  '*.css',
  '*.scss',
  '*.yaml',
  '*.toml',
  '*.md',
  '*.mdx',
  '*.graphql',
  '*.vue',
  '*.svelte'
}

local prettier = function(parser)
  return function()
    return {
      exe = 'yarn prettier',
      args = { '-w', ('--parser %s'):format(parser) },
      stdin = false
    }
  end
end

local opts = {
  filetype = {
    c = {
      function()
        return {
          exe = 'clang-format',
          args = { '-i' },
          cwd = vim.fn.expand('%:p:h'),
          stdin = false
        }
      end
    },
    cmake = {
      function()
        return {
          exe = 'cmake-format',
          args = { '-i' },
          cwd = vim.fn.expand('%:p:h'),
          stdin = false
        }
      end
    },
    nix = { function() return { exe = 'nixfmt', stdin = false } end },
    rust = { function() return { exe = 'rustfmt', stdin = false } end },
    lua = {
      function()
        return { exe = 'lua-format', args = { '-i' }, stdin = false }
      end
    },
    javascriptreact = { prettier('javascript') },
    typescriptreact = { prettier('typescript') },
    ['typescriptreact.tsx'] = { prettier('typescript') },
    go = {
      function() return { exe = 'gofmt', args = { '-w' }, stdin = false } end,
      function()
        return { exe = 'goimports', args = { '-w' }, stdin = false }
      end
    },
    python = {
      function() return { exe = 'black', args = { '-' }, stdin = false } end,
      function() return { exe = 'isort', args = { '-' }, stdin = false } end
    },
    sh = {
      function()
        return { exe = 'shfmt', args = { '-w', '-s', '-i', 2 }, stdin = false }
      end
    },
    terraform = {
      function()
        return { exe = 'terraform', args = { 'fmt', '-' }, stdin = false }
      end
    }
  }
}

for _, ft in pairs({
  'html',
  'json',
  'json5',
  'css',
  'scss',
  'yaml',
  'toml',
  'markdown',
  'mdx',
  'graphql',
  'javascript',
  'typescript',
  'vue',
  'svelte'
}) do opts.filetype[ft] = { prettier(ft) } end

require('formatter').setup(opts)

vim.api.nvim_exec([[
  augroup FormatAutogroup
    au!
    au BufWritePost ]] .. table.concat(exts, ',') .. [[ FormatWrite
  augroup END
]], true)
