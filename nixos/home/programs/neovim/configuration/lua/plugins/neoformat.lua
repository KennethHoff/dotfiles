return {
'sbdchd/neoformat',
				enabled = true,
				config = function() 
								vim.keymap.set('n', '<leader>f', ':Neoformat')
				end

}
