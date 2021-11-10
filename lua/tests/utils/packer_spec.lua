local stub = require('luassert.stub')

describe('utils.packer', function()
  local packer_utils = require('utils.packer')
  local vars = require('vars')

  describe('create_dirs()', function()
    before_each(function() stub(os, 'execute') end)

    describe('when no directories are created', function()
      before_each(function()
        stub(vim.fn, 'isdirectory', function() return 0 end)
      end)

      it('creates the directories', function()
        packer_utils.create_dirs()
        assert.stub(os.execute).was_called_with(
          ('mkdir -p %s'):format(vars.cache_dir))
        for _, dir in pairs(packer_utils.dirs) do
          assert.stub(os.execute).was_called_with(('mkdir -p %s'):format(dir))
        end
      end)
    end)

    describe('when the directories are already created', function()
      before_each(function()
        stub(vim.fn, 'isdirectory', function() return 1 end)
      end)

      it('skips the directory creation', function()
        packer_utils.create_dirs()
        assert.stub(os.execute).was_not_called()
      end)
    end)
  end)

  describe('ensure()', function()
    local plugin_name = 'name/plugin'
    local data_path = vim.fn.stdpath('data')

    before_each(function()
      stub(vim.fn, 'system')
      stub(vim.fn, 'glob')
    end)

    describe('when the plugin is already installed', function()
      before_each(function() stub(vim.fn, 'empty', function() return 0 end) end)

      it('returns false and skips plugin download', function()
        assert.is_false(packer_utils.ensure(plugin_name))
        assert.stub(vim.fn.system).was_not_called()
      end)
    end)

    describe('when the plugin is not installed', function()
      before_each(function() stub(vim.fn, 'empty', function() return 1 end) end)

      it('returns true and downloads the plugin', function()
        assert.is_true(packer_utils.ensure(plugin_name))
        assert.stub(vim.fn.system).was_called_with({
          'git',
          'clone',
          '--depth',
          '1',
          ('https://github.com/%s'):format(plugin_name),
          ('%s/site/pack/packer/start/%s'):format(data_path, 'plugin')
        })
      end)

      describe('when opt is set to true', function()
        local opts = { opt = true }

        it('downloads the plugin in the opt folder', function()
          assert.is_true(packer_utils.ensure(plugin_name, opts))
          assert.stub(vim.fn.system).was_called_with({
            'git',
            'clone',
            '--depth',
            '1',
            ('https://github.com/%s'):format(plugin_name),
            ('%s/site/pack/packer/opt/%s'):format(data_path, 'plugin')
          })
        end)
      end)
    end)
  end)
end)
