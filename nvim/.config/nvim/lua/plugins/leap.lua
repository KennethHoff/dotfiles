return {
				"ggandor/leap.nvim",
				keys = {
								{ "s", "<cmd>lua require('leap').leap{ target = vim.fn.getchar() }<CR>", mode = { "n", "x" }, noremap = true, silent = true },
								{ "S", "<cmd>lua require('leap').leap{ target = vim.fn.getchar() }<CR>", mode = { "o", "n", "x" }, noremap = true, silent = true },
				},
				config = function()
								require('leap').set_default_keymaps()  -- Sets default key mappings
								-- You can also customize your configuration here
				end
}
