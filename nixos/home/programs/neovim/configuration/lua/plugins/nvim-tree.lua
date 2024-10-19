local width_ratio = 0.5
local heigth_ratio = 0.8

local function set_win()
	local lines = vim.opt.lines:get() - vim.opt.cmdheight:get()
	local columns = vim.opt.columns:get()

	local columns_width = math.floor(columns * width_ratio)
	local padding_x = columns - columns_width
	local start_column = math.floor(padding_x / 2)

	local window_height = math.floor(lines * heigth_ratio)
	local padding_y = lines - window_height
	local start_row = math.floor(padding_y / 2)

	return {
		relative = "editor",
		border = "rounded",
		width = columns_width,
		height = window_height,
		row = start_row,
		col = start_column,
	}
end

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		update_focused_file = {
			enable = true,
		},
		view = {
			float = {
				enable = true,
				quit_on_focus_loss = true,
				open_win_config = set_win(),
			},
		},
	},
}
