local global = vim.g
local lsp = vim.lsp
local vars = require('vars')

local handlers = {}

function handlers.toggle_tree()
  require('nvim-tree').toggle()
end

function handlers.handle_tree_open()
  require('bufferline.state').set_offset(vars.tree_width + 3,
    vars.tree_offset_label)
  require('nvim-tree').find_file(true)
end

function handlers.handle_tree_close()
  require('bufferline.state').set_offset(0)
end

function handlers.toggle_diag()
  if global.diagnostics_active == true then
    global.diagnostics_active = false
    lsp.diagnostic.clear(0)
    lsp.handlers['textDocument/publishDiagnostics'] = function() end
  else
    global.diagnostics_active = true
    lsp.handlers['textDocument/publishDiagnostics'] =
      lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false
      })
  end
end

function handlers.before_save()
  vim.cmd [[
    :keepjumps keeppatterns %s/\s\+$//e
  ]]
end

return handlers
