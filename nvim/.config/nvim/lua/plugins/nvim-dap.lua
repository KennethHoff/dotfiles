return {
				"mfussenegger/nvim-dap",
				config = function()
								-- Load the dap module
								local dap = require('dap')

								-- Configure the coreclr adapter

								dap.adapters.coreclr = {
												type = 'executable',
												command = '/usr/bin/netcoredbg',
												args = {'--interpreter=vscode'}
								}

								-- Optionally, configure the launch configuration
								dap.configurations.cs = {
												{
																type = "coreclr",
																name = "launch - netcoredbg",
																request = "launch",
																program = function()
																				return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
																end,
												},
								}
				end,
}
