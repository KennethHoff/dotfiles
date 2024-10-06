return {
				"ibhagwan/fzf-lua",
				-- optional for icon support
				dependencies = { "nvim-tree/nvim-web-devicons" },
				config = function()
								-- calling `setup` is optional for customization
								require("fzf-lua").setup({})
								vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, { desc = "Fzf Files" })
								-- nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
				end
}
