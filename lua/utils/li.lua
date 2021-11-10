local function li(target, source)
  vim.cmd(string.format('hi! link %s %s', target, source))
end

return li
