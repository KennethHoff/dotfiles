return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzfLua = require("fzf-lua")
		vim.keymap.set("n", "<leader>ff", fzfLua.files, { desc = "Fzf Files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep_project<CR>", { desc = "Fzf File Content" })
		vim.keymap.set("n", "<leader>f*", "<cmd>FzfLua grep_cword<CR>", { desc = "Fzf File Content" })
	end,
}
