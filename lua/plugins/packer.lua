local vars = require('vars')
local colors = require('colors')
local hi = require('utils.hi')
local packer = require('packer')

-- highlights
hi('packerStatus', colors.brink_pink)
hi('packerStatusCommit', colors.orange_peel)
hi('packerStatusSuccess', colors.mint_green)
hi('packerStatusFail', colors.brink_pink)
hi('packerPackageName', colors.secondary)
hi('packerPackageNotLoaded', colors.botticelli)
hi('packerString', colors.primary)
hi('packerBool', colors.brink_pink)
hi('packerBreakingChange', colors.brink_pink)
hi('packerTimeHigh', colors.brink_pink)
hi('packerTimeMedium', colors.orange_red)
hi('packerTimeLow', colors.orange_peel)
hi('packerTimeTrivial', colors.mint_green)
hi('packerWorking', colors.secondary)
hi('packerSuccess', colors.mint_green)
hi('packerFail', colors.brink_pink)
hi('packerHash', colors.secondary)
hi('packerRelDate', colors.secondary)
hi('packerProgress', colors.secondary)
hi('packerOutput', colors.brink_pink)

packer.init {
  log = { level = vars.debug and 'trace' or 'info' },
  profile = { enable = vars.profile, threshold = 1 },
  display = {
    working_sym = vars.packer.symbols.working,
    error_sym = vars.packer.symbols.error,
    done_sym = vars.packer.symbols.done,
    removed_sym = vars.packer.symbols.removed,
    moved_sym = vars.packer.symbols.moved,
    header_sym = vars.packer.symbols.header,
    prompt_border = 'single',
    keybindings = {
      quit = 'q',
      toggle_info = '<cr>',
      diff = 'd',
      prompt_revert = 'r'
    }
  }
}
packer.reset()
