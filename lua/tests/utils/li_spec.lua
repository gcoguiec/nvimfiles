local stub = require('luassert.stub')

describe('utils.li()', function()
  local li = require('utils.li')

  before_each(function() stub(vim, 'cmd') end)

  it('links two highlight items together', function()
    local a = 'Color1'
    local b = 'Color2'
    li(a, b)
    assert.stub(vim.cmd).was_called_with(('hi! link %s %s'):format(a, b))
  end)
end)
