return {
				"rlane/pounce.nvim",
				config = function()
								vim.keymap.set({ 'n', 'o', 'v' }, '<leader>j', '<cmd>Pounce<CR>')
								vim.keymap.set({ 'n', 'o', 'v' }, '<leader>J', '<cmd>PounceRepeat<CR>')
				end
}
