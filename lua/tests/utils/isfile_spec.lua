local stub = require('luassert.stub')

describe('utils.isfile()', function()
  local isfile = require('utils.isfile')

  describe('when the file does not exist', function()
    before_each(function()
      stub(vim.loop, 'fs_stat', function() return nil end)
    end)

    it('returns false', function() assert.is_false(isfile('foo.md')) end)
  end)

  describe('when the file does exist', function()
    before_each(function()
      stub(vim.loop, 'fs_stat', function() return { type = true } end)
    end)

    it('returns true', function() assert.is_true(isfile('foo.md')) end)
  end)
end)
