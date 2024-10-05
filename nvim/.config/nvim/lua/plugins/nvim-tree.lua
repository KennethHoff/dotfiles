return {
				"nvim-tree/nvim-tree.lua",
				version = "*",
				lazy = false,
				dependencies = {
								"nvim-tree/nvim-web-devicons",
								"b0o/nvim-tree-preview.lua",
								"nvim-lua/plenary.nvim"
				},
				config = function()
								local api = require('nvim-tree.api')
								local preview = require('nvim-tree-preview')

								require('nvim-tree').setup {
												on_attach = function(bufnr)
																-- Set up default keymaps
																api.config.mappings.default_on_attach(bufnr)

																local function opts(desc)
																				return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
																end

																vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
																vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')

																-- Smart tab behavior: Only preview files, expand/collapse directories
																vim.keymap.set('n', '<Tab>', function()
																				local ok, node = pcall(api.tree.get_node_under_cursor)
																				if ok and node then
																								if node.type == 'directory' then
																												api.node.open.edit()
																								else
																												preview.node(node, { toggle_focus = true })
																								end
																				end
																end, opts 'Preview')
												end,
								}
				end
}
