local vars = require('vars')

local packer_utils = {
  dirs = {
    vars.cache_dir .. 'swap',
    vars.cache_dir .. 'undo',
    vars.cache_dir .. 'backup',
    vars.cache_dir .. 'view',
    vars.cache_dir .. 'sessions'
  }
}

function packer_utils.create_dirs()
  if vim.fn.isdirectory(vars.cache_dir) == 0 then
    os.execute(('mkdir -p %s'):format(vars.cache_dir))
  end
  for _, dir in pairs(packer_utils.dirs) do
    if vim.fn.isdirectory(dir) == 0 then
      os.execute(('mkdir -p %s'):format(dir))
    end
  end
end

function packer_utils.ensure(plugin_name, opts)
  opts = opts or {}
  local freshly_installed = false
  local url = ('https://github.com/%s'):format(plugin_name)
  local segments = vim.split(plugin_name, '/')
  local install_path = vim.fn.stdpath('data') ..
                         ('/site/pack/packer/%s/%s'):format(
      opts.opt and 'opt' or 'start', segments[2])
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', url, install_path })
    freshly_installed = true
  end
  return freshly_installed
end

return packer_utils
