local debugger_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/lazy/opt/vscode-js-debug"

-- Set keymaps to control the debugger
-- https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<F10>", require("dap").step_over)
vim.keymap.set("n", "<F11>", require("dap").step_into)
vim.keymap.set("n", "<F12>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

-- setup adapters
require("dap-vscode-js").setup({
	-- debugger_path = "/home/gildas/.local/share/lunarvim/site/pack/lazy/opt/vscode-js-debug",
	node_path = "node",
	debugger_path = debugger_path,
	-- debugger_cmd = { "js-debug-adapter" },
	adapters = {
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
	},
})

local dap = require("dap")

-- custom adapter for running tasks before starting debug
local custom_adapter = "pwa-node-custom"
dap.adapters[custom_adapter] = function(_, config) -- renamed cb to _ on 20231001
	if config.preLaunchTask then
		local async = require("plenary.async")
		local notify = require("notify").async

		async.run(function()
			---@diagnostic disable-next-line: missing-parameter
			notify("Running [" .. config.preLaunchTask .. "]").events.close()
		end, function()
			vim.fn.system(config.preLaunchTask)
			config.type = "pwa-node"
			dap.run(config)
		end)
	end
end

-- language configs*

for _, language in ipairs({ "typescript" }) do
	require("dap").configurations[language] = {
		-- inspiration from
		-- https://github.com/anasrar/.dotfiles/blob/48ba127aee8d5791de091a7e1757d681ca748b07/neovim/.config/nvim/lua/rin/DAP/languages/typescript.lua#L127-L137
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Typescript file (pwa-node with ts-node)",
			cwd = vim.fn.getcwd(),
			-- runtimeArgs = { "--loader", "ts-node/esm" },
			-- runtimeExecutable = "node",
			runtimeArgs = { "--esm" },
			runtimeExecutable = "ts-node",
			args = { "${file}" },
			sourceMaps = true,
			protocol = "inspector",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		},
	}
end

for _, language in ipairs({ "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Javascript file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			rootPath = "${workspaceFolder}",
			sourceMaps = true,
			skipFiles = { "<node_internals>/**" },
			protocol = "inspector",
			console = "integratedTerminal",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to Node process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			rootPath = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-chrome",
			name = "Attach - Remote Debugging",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			name = "Launch Chrome",
			request = "launch",
			url = "http://localhost:3000",
		},
	}
end

-- for _, language in ipairs({ "typescript", "javascript" }) do
-- 	dap.configurations[language] = {
-- 		{
-- 			name = "Launch",
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			program = "${file}",
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			console = "integratedTerminal",
-- 		},
-- 		{
-- 			name = "Attach to node process",
-- 			type = "pwa-node",
-- 			request = "attach",
-- 			rootPath = "${workspaceFolder}",
-- 			processId = require("dap.utils").pick_process,
-- 		},
-- 		{
-- 			name = "Debug Main Process (Electron)",
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			program = "${workspaceFolder}/node_modules/.bin/electron",
-- 			args = {
-- 				"${workspaceFolder}/dist/index.js",
-- 			},
-- 			outFiles = {
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			resolveSourceMapLocations = {
-- 				"${workspaceFolder}/dist/**/*.js",
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			console = "integratedTerminal",
-- 		},
-- 		{
-- 			name = "Compile & Debug Main Process (Electron)",
-- 			type = custom_adapter,
-- 			request = "launch",
-- 			preLaunchTask = "npm run build-ts",
-- 			program = "${workspaceFolder}/node_modules/.bin/electron",
-- 			args = {
-- 				"${workspaceFolder}/dist/index.js",
-- 			},
-- 			outFiles = {
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			resolveSourceMapLocations = {
-- 				"${workspaceFolder}/dist/**/*.js",
-- 				"${workspaceFolder}/dist/*.js",
-- 			},
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			console = "integratedTerminal",
-- 		},
-- 	}
-- end
