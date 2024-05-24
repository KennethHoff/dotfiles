--- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  --- Packer itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  --- Closes brackets
  use 'rstacruz/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  --- Creates threads; Used to running tests or whatnot from within Nvim
  use {
	'tpope/vim-dispatch', 
	opt = true, 
	cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
  }

  -- Load on an autocommand event
  --- Improves the `%` command in Vim
  use {
  	'andymass/vim-matchup', 
	event = 'VimEnter'
  }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --- `Asynchronous Lint Engine`
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have post-install/update hooks
  --- Markdown previewer (Through Command)
  use {
	  'iamcco/markdown-preview.nvim',
	  run = 'cd app && yarn install',
	  cmd = 'MarkdownPreview'
  }

  -- Post-install/update hook with neovim command
  --- Tree-sitter; Auto-updating
  use {
	  'nvim-treesitter/nvim-treesitter', 
	  run = ':TSUpdate' 
  }

  -- Use specific branch, dependency and run lua file after load
  --- Status bar
  use {
    'glepnir/galaxyline.nvim', 
    branch = 'main', 
    requires = {'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- Use dependency and run lua function after load
  --- Git integration
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

--- Adds line/block comment keybinding
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
--- LSP configuration
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
    use("onsails/lspkind-nvim")
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
    })

    -- cmp: Autocomplete
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
    })

    use("hrsh7th/cmp-nvim-lsp")

    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

-- TODO: Figure out how to add GitHub Copilot support.
-- I managed to add it, but I couldn't get the keybindings to work.
end)
