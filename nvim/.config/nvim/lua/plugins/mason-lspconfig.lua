return {
				"williamboman/mason-lspconfig.nvim",
				config = function()
								require("mason").setup()
								require("mason-lspconfig").setup {
												ensure_installed = { "lua_ls", "rust_analyzer" }
								}

								require("lspconfig").lua_ls.setup {
												settings = {
																Lua = {
																				diagnostics = {
																								globals = { "vim" },  -- Add any globals you want here
																				},
																},
												},
								}
				end
}
