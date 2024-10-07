return {
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = {
								"mfussenegger/nvim-dap",
								"williamboman/mason.nvim"
				},
				opts = {
								-- reasonable debug configurations
								automatic_installation = true,
				},
				config = function()
								require("mason-nvim-dap").setup({
												ensure_installed = { "js", "coreclr" }
								})
				end

}
