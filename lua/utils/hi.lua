local function hi(name, foreground, background, style, special)
  local fg = 'guifg=' .. (foreground or 'NONE')
  local bg = 'guibg=' .. (background or 'NONE')
  local decoration = 'gui=' .. (style or 'NONE')
  local sp = 'guisp=' .. (special or foreground or 'NONE')
  local hi_command = string.format('hi %s %s %s %s %s', name, fg, bg,
    decoration, sp)
  vim.cmd(hi_command)
end

return hi
