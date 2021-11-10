local stub = require('luassert.stub')

describe('utils.hi()', function()
  local hi = require('utils.hi')
  local name = 'Test'

  before_each(function() stub(vim, 'cmd') end)

  describe('when only providing a name', function()
    it('assigns every parameter to NONE', function()
      hi(name)
      assert.stub(vim.cmd).was_called_with(
        ('hi %s guifg=NONE guibg=NONE gui=NONE guisp=NONE'):format(name))
    end)
  end)

  describe('when a foreground color is provided', function()
    local foreground = '#color'

    it('assigns the foreground parameter', function()
      hi(name, foreground)
      assert.stub(vim.cmd).was_called_with(
        ('hi %s guifg=%s guibg=NONE gui=NONE guisp=%s'):format(name, foreground,
          foreground))
    end)
  end)

  describe('when a background color is provided', function()
    local background = '#color'

    it('assigns the background parameter', function()
      hi(name, nil, background)
      assert.stub(vim.cmd).was_called_with(
        ('hi %s guifg=NONE guibg=%s gui=NONE guisp=NONE'):format(name,
          background))
    end)
  end)

  describe('when a style is provided', function()
    local style = 'reverse'

    it('assigns the style parameter', function()
      hi(name, nil, nil, style)
      assert.stub(vim.cmd).was_called_with(
        ('hi %s guifg=NONE guibg=NONE gui=%s guisp=NONE'):format(name, style))
    end)
  end)

  describe('when a special value is provided', function()
    local special = '#color'

    it('assigns the special value', function()
      hi(name, nil, nil, nil, special)
      assert.stub(vim.cmd).was_called_with(
        ('hi %s guifg=NONE guibg=NONE gui=NONE guisp=%s'):format(name, special))
    end)
  end)
end)
