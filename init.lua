local vars = require('vars')
local packer_utils = require('utils.packer')

packer_utils.create_dirs()
packer_utils.ensure('nvim-lua/plenary.nvim')
packer_utils.ensure('lewis6991/impatient.nvim')
local first_run = packer_utils.ensure('wbthomason/packer.nvim', { opt = true })

vim.cmd('packadd! packer.nvim')

require('plugins.packer')

if not first_run then
  require('impatient')
  if vars.profile then require('impatient').enable_profile() end
end

require('main')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
