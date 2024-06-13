return require('packer').startup(function(use)
	--- Packer can manage itself
	use 'wbthomason/packer.nvim'

	--- Mason and LSP Config
	use {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
	}

	--- Closes brackets
	use 'rstacruz/vim-closer'

	--- Dispatches commands; Used to running tests or whatnot from within Nvim
	use {
		'tpope/vim-dispatch', 
		opt = true, 
		cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
	}

	--- Improves the `%` command in Vim
	use {
		'andymass/vim-matchup', 
		event = 'VimEnter'
	}

	--- `Asynchronous Lint Engine`
	use {
		'w0rp/ale',
		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}

	--- Markdown previewer (Through Command)
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && yarn install',
		cmd = 'MarkdownPreview'
	}

	--- Tree-sitter
	use {
		'nvim-treesitter/nvim-treesitter', 
		run = ':TSUpdate' 
	}

	--- Status bar
	use {
		'glepnir/galaxyline.nvim', 
		branch = 'main', 
		requires = {'kyazdani42/nvim-web-devicons', opt = true },
	}

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
	
	--- Snippets
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})

	--- LSP configuration
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
		}
	}


	-- TODO: Figure out how to add GitHub Copilot support.
	-- I managed to add it, but I couldn't get the keybindings to work.
end)
