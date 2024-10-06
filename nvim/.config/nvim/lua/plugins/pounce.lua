return {
				"rlane/pounce.nvim",
				config = function()
								vim.keymap.set('n', 's', '<cmd>Pounce<CR>')
								vim.keymap.set('n', 'S', '<cmd>PounceRepeat<CR>')
								vim.keymap.set('o', 'gs', '<cmd>Pounce<CR>')
								vim.keymap.set('o', 'S', '<cmd>PounceRepeat<CR>')
				end
}
