local config = vim.opt
local global = vim.g
local vars = require('vars')

local encoding = 'utf-8'
local lang = vim.fn.has('unix') == 1 and 'en_US.UTF-8' or 'en'

if vim.fn.exists('&compatible') == 1 then config.compatible = false end
if vim.fn.has('gui_running') == 1 then config.t_Co = 256 end

-- https://neovim.io/doc/user/quickref.html#option-list
config.magic = true
config.history = 1000
config.background = 'dark'
config.encoding = encoding
config.fileencoding = encoding
config.expandtab = true
config.shiftwidth = 2
config.tabstop = 2
config.softtabstop = 2
config.smarttab = true
config.smartindent = true
config.shiftround = true
config.number = true
config.relativenumber = false
config.title = true
config.fileformats = 'unix,mac,dos'
config.hidden = true
config.wrap = false
config.sidescroll = 1
config.autoindent = false
config.errorbells = false
config.visualbell = true
config.scrolloff = 4
config.sidescrolloff = 10
config.incsearch = true
config.ignorecase = true
config.smartcase = true
config.hlsearch = true
config.grepformat = '%f:%l:%c:%m'
config.grepprg =
  'rg --hidden --vimgrep --smart-case --glob "!{.git,node_modules,*~}/*" --'
config.cursorline = true
config.ruler = true
config.virtualedit = 'block'
config.backspace = 'indent,eol,start'
config.guifont = 'JetBrainsMono Nerd Font Mono:h16'
config.guicursor = 'a:blinkon0,n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
config.textwidth = 79
config.breakindent = true
config.clipboard = 'unnamedplus'
config.spell = false
config.joinspaces = false
config.lazyredraw = true
config.ttyfast = true
config.numberwidth = 8
config.fcs = 'eob: '
config.foldmethod = 'expr'
config.foldlevelstart = 99
config.foldexpr = 'nvim_treesitter#foldexpr()'
config.foldenable = true
config.laststatus = 2
config.showmode = false
config.showcmd = true
config.cmdheight = 1
config.updatetime = 250
config.redrawtime = 100
config.timeout = true
config.ttimeout = true
config.timeoutlen = 250
config.ttimeoutlen = 10
config.splitright = true
config.splitbelow = true
config.wildmenu = true
config.wildmode = 'full'
config.inccommand = 'nosplit'
config.showmatch = true
config.confirm = true
config.shortmess = 'aotTIcF'
config.undofile = true
config.swapfile = false
config.writebackup = false
config.backup = false
config.completeopt = 'menuone,noselect,noinsert'
config.jumpoptions = 'stack'
config.diffopt = 'filler,iwhite,internal,algorithm:patience'
config.backspace = 'indent,eol,start'
config.switchbuf = 'useopen'
config.breakat = [[\ \	;:,!?]]
config.whichwrap = 'h,l,<,>,[,],~'
config.wildignorecase = true
config.wildignore =
  '.git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,**/node_modules/**'
config.conceallevel = 2
config.concealcursor = 'niv'
config.formatoptions = '1jcroql'
config.synmaxcol = 1000
config.breakindentopt = 'shift:2,min:20'

-- directories
config.directory = vars.cache_dir .. 'swap/'
config.undodir = vars.cache_dir .. 'undo/'
config.backupdir = vars.cache_dir .. 'backup/'
config.viewdir = vars.cache_dir .. 'view/'

-- leader
global.mapleader = ' '
global.maplocalleader = ' '

-- disable built-in plugins
global.loaded_gzip = 1
global.loaded_tar = 1
global.loaded_tarPlugin = 1
global.loaded_zip = 1
global.loaded_zipPlugin = 1
global.loaded_getscript = 1
global.loaded_getscriptPlugin = 1
global.loaded_vimball = 1
global.loaded_vimballPlugin = 1
global.loaded_matchit = 1
global.loaded_matchparen = 1
global.loaded_2html_plugin = 1
global.loaded_logiPat = 1
global.loaded_rrhelper = 1
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1
global.loaded_netrwSettings = 1
global.loaded_netrwFileHandlers = 1
global.did_load_filetypes = 1

-- syntax
vim.cmd [[
  syntax enable
  filetype on
  filetype plugin indent on
  filetype indent on
]]

-- lang
vim.fn.execute('language messages ' .. lang)
vim.fn.execute('set langmenu=' .. lang)

-- mouse
if vim.fn.has('mouse') == 1 then config.mouse = 'a' end

if vim.fn.has('ttymouse') == 1 then
  config.ttymouse = vim.fn.has('mouse_sgr') and 'sgr' or 'xterm2'
end

-- clipboard
if vim.fn.has('macunix') == 1 then
  global.clipboard = {
    name = 'macOS-clipboard',
    copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
    paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
    cache_enabled = 0
  }
end

-- extra commands
vim.cmd [[
  set list listchars=tab:»·,trail:·,nbsp:⦸,space:·,precedes:←,extends:→,conceal:┊
  set fillchars+=vert:│
  au!
  au BufWritePre * lua require('handlers').before_save()
  au VimLeave * set guicursor=a:ver10-blinkoff0
  au TermOpen * setlocal nonumber norelativenumber
]]
