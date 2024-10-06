return {
				"neovim/nvim-lspconfig",
				config = function()
								local lspconfig = require('lspconfig')

								-- Configure ts_ls.
								lspconfig.ts_ls.setup({
												on_attach = function(_, bufnr)
																-- Key mappings for LSP
																local opts = { noremap=true, silent=true, buffer=bufnr }
																-- Go to definition
																vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
																-- Go to usages/references
																vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
												end,
								})
				end
}
