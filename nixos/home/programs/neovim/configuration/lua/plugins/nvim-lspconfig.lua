return {
	{
		"neovim/nvim-lspconfig",
    config = function() 
      local lsp = require('lspconfig')
      lsp.nil_ls.setup{}
      lsp.lua_ls.setup{}
    end
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
