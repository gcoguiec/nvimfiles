std = 'lua51+nvim'

stds.nvim = {
  read_globals = { 'jit' }
}

exclude_files = {
  'plugin/**',
  '.install/**',
  '.luarocks/**'
}

globals = {
  'vim'
}
