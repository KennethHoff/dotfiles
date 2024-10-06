return {
				"nvim-neotest/neotest",
				dependencies = {
								"nvim-neotest/nvim-nio",
								"nvim-lua/plenary.nvim",
								"antoinemadec/FixCursorHold.nvim",
								"nvim-treesitter/nvim-treesitter",
								"neotest-dotnet"
				},
				config = function()
								local neotest = require('neotest')
								neotest.setup({
												adapters = {
																require("neotest-dotnet")
												},

								})
				end
}
