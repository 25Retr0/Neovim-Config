return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-python").setup("python3")

		dap.adapters.python = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}", -- run current file
				pythonPath = function()
					-- Use current venv if available
					local venv = os.getenv("VIRTUAL_ENV")
					if venv then
						return venv .. "/bin/python"
					else
						return "python3"
					end
				end,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local opts = { noremap = true, silent = true }

		-- Toggle breakpoint
		vim.keymap.set("n", "<leader>dt", function()
			dap.toggle_breakpoint()
		end, opts)

		-- Continue / Start
		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, opts)

		-- Step Over
		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end, opts)

		-- Step Into
		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, opts)

		-- Step Out
		vim.keymap.set("n", "<leader>dO", function()
			dap.step_out()
		end, opts)

		-- Keymap to terminate debugging
		vim.keymap.set("n", "<leader>dq", function()
			require("dap").terminate()
		end, opts)

		-- Toggle DAP UI
		vim.keymap.set("n", "<leader>du", function()
			dapui.toggle()
		end, opts)
	end,
}
