return { 
				"mfussenegger/nvim-dap",
				dependencies = {
								"rcarriga/nvim-dap-ui",
								"nvim-neotest/nvim-nio",
								"theHamsta/nvim-dap-virtual-text"
				},
				config = function() 
								local dap = require("dap")
								local dap_ui = require("dapui")

								dap_ui.setup()
								require("nvim-dap-virtual-text").setup()

								vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

								vim.keymap.set("n", "<F1>", dap.continue)







								dap.listeners.before.attach.dapui_config = function()
												ui.open()
								end
								dap.listeners.before.launch.dapui_config = function()
												ui.open()
								end
								dap.listeners.before.event_terminated.dapui_config = function()
												ui.close()
								end
								dap.listeners.before.event_exited.dapui_config = function()
												ui.close()
								end
				end
}
