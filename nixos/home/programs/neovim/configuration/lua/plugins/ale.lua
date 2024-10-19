return {
	'dense-analysis/ale',
				enabled = false,
	config = function()
		vim.g.ale_linters = {
			ruby = { 'rubocop', 'ruby' },
			lua = { 'lua_language_server' },
			nix = { 'alejandra ' }
		}
	end
}
