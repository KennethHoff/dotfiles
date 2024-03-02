--- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Simple plugins can be specified as strings
  use('rstacruz/vim-closer')

  -- Lazy loading:
  -- Load on specific commands
  use({
	'tpope/vim-dispatch', 
	opt = true, 
	cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
  })

  -- Load on an autocommand event
  use({
  	'andymass/vim-matchup', 
	event = 'VimEnter'
  })

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use( {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  })

  -- Plugins can have dependencies on other plugins
  use({
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  })

  -- You can specify rocks in isolation
  -- TODO: Re-enable this (whatever it does) whenever I can get `hererocks` to install.
--  use_rocks 'penlight'
--  use_rocks {'lua-resty-http', 'lpeg'}

  -- Plugins can have post-install/update hooks
  use({
	  'iamcco/markdown-preview.nvim',
	  run = 'cd app && yarn install',
	  cmd = 'MarkdownPreview'
  })

  -- Post-install/update hook with neovim command
  use({
	  'nvim-treesitter/nvim-treesitter', 
	  run = ':TSUpdate' 
  })

  -- Post-install/update hook with call of vimscript function with argument
  use({ 
	  'glacambre/firenvim', 
	  run = function() vim.fn['firenvim#install'](0) 
	  end
  })

  -- Use specific branch, dependency and run lua file after load
  use({
    'glepnir/galaxyline.nvim', 
    branch = 'main', 
    requires = {'kyazdani42/nvim-web-devicons', opt = true },
  })

  -- Use dependency and run lua function after load
  use({
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  })

  -- You can specify multiple plugins in a single call
  use({
	  'tjdevries/colorbuddy.vim', 
	  {'nvim-treesitter/nvim-treesitter', opt = true}
  })

  -- You can alias plugin names
  use({
	  'dracula/vim',
	  as = 'dracula'
  })

  -- Things I know what it does.. lol
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
	require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})
    end,
  }



end)
