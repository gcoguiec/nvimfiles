local vars = require('vars')

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  -- profiling
  if vars.profile == true then
    use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }
  end

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.nvim-tree') end
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.web-devicons') end
  }
  use {
    'editorconfig/editorconfig',
    config = function() require('plugins.editorconfig') end
  }
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.barbar') end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.lualine') end
  }
  use({
    'folke/persistence.nvim',
    event = 'BufReadPre',
    module = 'persistence',
    config = function() require('plugins.persistence') end
  })
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.alpha') end
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'ray-x/cmp-treesitter' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' }
    },
    config = function() require('plugins.cmp') end
  }
  use {
    'aserowy/tmux.nvim',
    module = { 'tmux' },
    config = function() require('plugins.tmux').config() end
  }
  use {
    'mhartington/formatter.nvim',
    cmd = { 'Format', 'FormatWrite' },
    config = function() require('plugins.formatter') end
  }

  -- comfort
  if vars.enable.comfort == true then
    use {
      'folke/which-key.nvim',
      config = function() require('plugins.which-key') end
    }
    use {
      'windwp/nvim-ts-autotag',
      config = function() require('nvim-ts-autotag').setup() end
    }
    use {
      'windwp/nvim-autopairs',
      config = function() require('plugins.autopairs') end
    }
    use {
      'b3nj5m1n/kommentary',
      setup = function() vim.g.kommentary_create_default_mappings = false end,
      config = function() require('plugins.kommentary') end
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require('plugins.indent') end
    }
    use { 'kevinhwang91/nvim-bqf', branch = 'main', ft = { 'qf' } }
  end

  -- treesitter
  if vars.enable.treesitter == true then
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end
    }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'RRethy/nvim-treesitter-textsubjects'
    use 'mizlan/iswap.nvim'
    use 'mfussenegger/nvim-ts-hint-textobject'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'
  end

  -- lsp
  if vars.enable.lsp == true then
    use 'folke/lua-dev.nvim'
    use {
      'neovim/nvim-lspconfig',
      config = function() require('plugins.lsp') end
    }
    use {
      'ray-x/lsp_signature.nvim',
      config = function() require('plugins.lsp-signature') end
    }
    use {
      'williamboman/nvim-lsp-installer',
      config = function() require('plugins.lsp-installer') end
    }
    use {
      'folke/trouble.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('plugins.trouble') end
    }
    use 'folke/lsp-colors.nvim'
    use {
      'onsails/lspkind-nvim',
      config = function() require('lspkind').init {} end
    }
  end

  -- telescope
  if vars.enable.telescope == true then
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('plugins.telescope') end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  end

  -- git
  if vars.enable.git == true then
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      tag = 'release',
      config = function() require('plugins.gitsigns') end
    }
    use { 'pwntester/octo.nvim', config = function() require('plugins.octo') end }
  end
end)
