return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = true,
		-- formatters = {
		-- 	csharpier = {
		-- 		command = "dotnet",
		-- 		args = { "csharpier", "--write-stdout", "$FILENAME" },
		-- 		stdin = true,
		-- 	},
		-- },
		formatters_by_ft = {
			lua = { "stylua" },
			-- cs = { "csharpier" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 5000,
			lsp_format = false,
		},
	},
}
